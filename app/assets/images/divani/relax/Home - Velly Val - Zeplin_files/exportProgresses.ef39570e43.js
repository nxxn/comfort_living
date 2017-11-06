/* eslint-disable strict */

(function () {
    "use strict";

    if (typeof process === "undefined") {
        return;
    }

    var electron = require("electron"),
        ipcRenderer = electron.ipcRenderer,
        hasWebviewsFeature = !!electron && !!electron.features && !!electron.features.webviews;

    var EXPORT_DONE_MESSAGE_CLASSES = [
        "message4",
        "message2",
        "message3",
        "message4",
        "message2",
        "message3",
        "message4",
        "message2",
        "message3",
        "message1"
    ]; // this repetition is to limit the probability of message1 showing
    var EXPORT_DONE_CLASSES_CACHE = {};

    var EXPORT_PROGRESS_CLEAR_DURATION = 200,
        EXPORT_PROGRESSES_RESIZE_DELAY = 150,
        EXPORTS_PROGRESS_RADIAL = 15,
        EXPORTS_PROGRESS_BAR_CIRCUMFERENCE = 2 * EXPORTS_PROGRESS_RADIAL * Math.PI,
        EXPORT_PROGRESS_HEIGHT = 74,
        EXPORT_PROGRESS_CLEAR_INCREMENTAL_DELAY = 80,
        SUBSCRIBE_TO_EXPORTS_CHANNEL = "subscribe-to-exports",
        EXPORTS_CHANGE_CHANNEL = "exports-change",
        EXPORTS_STARTED_CHANNEL = "exports-started";

    var exportProgresses = document.getElementById("exportProgresses"),
        exportProgressTemplate = document.getElementById("exportProgressTemplate"),
        exportProgressProjectGroupTemplate = document.getElementById("exportProgressProjectGroupTemplate"),
        exportDestination = document.getElementById("exportDestination"),
        exportProgressesButton = document.getElementById("exportProgressesButton"),
        exportProgressesContainer = document.getElementById("exportProgressesContainer"),
        clearExportProgresses = document.getElementById("clearExportProgresses"),
        exportsProgressBar = document.getElementById("exportsProgressBar"),
        notificationContainer = document.getElementById("notificationContainer"),
        userMenu = document.getElementById("userMenu");

    function isExportGettingProject(progress) {
        return progress.isGettingProject && !progress.isGettingProjectFailed;
    }

    function isExportFailedAtGettingProject(progress) {
        return progress.isGettingProject && progress.isGettingProjectFailed;
    }

    function isExportDone(progress) {
        return progress.countOfUploadedImages === progress.countOfImagesToUpload &&
            progress.isApiOperationCompleted && !progress.isApiOperationFailed;
    }

    function isExportFailed(progress) {
        return progress.isApiOperationFailed;
    }

    function isExportTicklingTheBackend(progress) {
        return progress.countOfUploadedImages === progress.countOfImagesToUpload &&
            !progress.isApiOperationCompleted;
    }

    function isExportUploadingImages(progress) {
        return progress.countOfUploadedImages < progress.countOfImagesToUpload &&
            !progress.isApiOperationCompleted;
    }

    function retryExport(screenExportId) {
        ipcRenderer.send("retry-export", screenExportId);
    }

    function cancelExport(screenExportId) {
        ipcRenderer.send("cancel-export", screenExportId);
    }

    function retryGettingProject(screenExportId) {
        ipcRenderer.send("retry-getting-project", screenExportId);
    }

    function calculateProgress(screenExport) {
        if (screenExport.progress.isApiOperationCompleted) {
            return 100;
        } else {
            return Math.floor(
                (screenExport.progress.countOfUploadedImages / (screenExport.progress.countOfImagesToUpload + 1)) * 100
            );
        }
    }

    function goToScreen(pid, sid) {
        hideExportProgressesContainer();
        location.assign("/project/" + pid + "/screen/" + sid);
    }

    function handleExportProgressesClick(ev) {
        ev.stopPropagation();
        var exportProgress = ev.target.closest(".exportProgress");
        if (exportProgress) {
            if (exportProgress.classList.contains("exportProgressDone")) {
                goToScreen(exportProgress.dataset.projectId, exportProgress.dataset.screenId);
            } else if (ev.target.classList.contains("retryExport")) {
                retryExport(ev.target.parentElement.dataset.screenExportId);
            } else if (ev.target.classList.contains("cancelExport")) {
                cancelExport(ev.target.parentElement.dataset.screenExportId);
            } else if (ev.target.classList.contains("retryFetchProject")) {
                retryGettingProject(ev.target.parentElement.parentElement.dataset.screenExportId);
            }
        }
    }

    function addExportProgress(container) {
        return function (screenExport) {
            var newExportProgress = document.importNode(exportProgressTemplate.content, true);
            var exportProgressDiv = newExportProgress.querySelector(".exportProgress");

            exportProgressDiv.dataset.screenExportId = screenExport._id;

            if (isExportGettingProject(screenExport.progress)) {
                exportProgressDiv.classList.add("gettingProject");
            } else if (isExportFailedAtGettingProject(screenExport.progress)) {
                exportProgressDiv.classList.add("gettingProjectFailed");
            } else {
                exportProgressDiv.dataset.projectId = screenExport.project._id;
                exportProgressDiv.dataset.screenId = screenExport.screen._id;

                if (screenExport.progress.update) {
                    exportProgressDiv.classList.add("updateScreen");
                } else {
                    exportProgressDiv.classList.add("newScreen");
                }
                newExportProgress.querySelector(".screenName").textContent = screenExport.screen.name;

                if (screenExport.progress.isApiOperationFailed) {
                    newExportProgress.querySelector(".exportProgressBar").style.width = "0%";
                } else {
                    newExportProgress.querySelector(".exportProgressBar").style.width = calculateProgress(screenExport) + "%";
                }

                if (isExportDone(screenExport.progress)) {
                    if (!EXPORT_DONE_CLASSES_CACHE[screenExport._id]) {
                        EXPORT_DONE_CLASSES_CACHE[screenExport._id] = EXPORT_DONE_MESSAGE_CLASSES[Math.floor(
                            Math.random() * (EXPORT_DONE_MESSAGE_CLASSES.length)
                        )];
                    }
                    exportProgressDiv.classList.add(EXPORT_DONE_CLASSES_CACHE[screenExport._id]);
                    exportProgressDiv.classList.add("exportProgressDone");
                } else if (isExportFailed(screenExport.progress)) {
                    exportProgressDiv.classList.add("exportProgressFailed");
                } else if (isExportTicklingTheBackend(screenExport.progress)) {
                    exportProgressDiv.classList.add("ticklingTheBackendStep");
                } else if (isExportUploadingImages(screenExport.progress)) {
                    exportProgressDiv.classList.add("uploadingImagesStep");
                    newExportProgress.querySelector(".uploadedImages").textContent = screenExport.progress.countOfUploadedImages;
                    newExportProgress.querySelector(".allImages").textContent = screenExport.progress.countOfImagesToUpload;
                }
            }

            if (container) {
                container.appendChild(newExportProgress);
            } else {
                document.querySelector('.exportProgressProjectGroup[data-pid="' + screenExport.project._id + '"] .exportProgressesOfProject').appendChild(newExportProgress);
            }
        };
    }

    function addProject(project) {
        var newProject = document.importNode(exportProgressProjectGroupTemplate.content, true);

        newProject.querySelector(".projectInformation").textContent = project.name + ", " + project.type;
        newProject.querySelector(".exportProgressProjectGroup").dataset.pid = project._id;

        exportProgresses.appendChild(newProject);
    }

    function handleExportsChange(event, exports) {
        if (exports.length === 0) {
            exportProgressesButton.classList.add("hidden");
            exportProgressesContainer.classList.add("hidden");
            return;
        }

        exportProgresses.style.height = "auto";
        exportProgressesButton.classList.remove("hidden");
        exportProgresses.innerHTML = "";

        var exportInformation = exports.reduce(function (acc, screenExport, index) {
            var foundProject = acc.projects.find(function (existingProject) {
                return existingProject._id === screenExport.project._id;
            });

            return {
                projects: foundProject ? acc.projects : acc.projects.concat(screenExport.project),
                progress: Math.floor(((acc.progress * index) + calculateProgress(screenExport)) / (index + 1)),
                anyExportFailed: acc.anyExportFailed || !!screenExport.progress.isApiOperationFailed
            };
        }, {
            projects: [],
            progress: 0,
            anyExportFailed: false
        });

        var projects = exportInformation.projects;

        var exportsProgressPercentage = exportInformation.progress;

        exportsProgressBar.setAttribute(
            "stroke-dasharray",
            (EXPORTS_PROGRESS_BAR_CIRCUMFERENCE * exportsProgressPercentage / 100) + " " +
            (EXPORTS_PROGRESS_BAR_CIRCUMFERENCE * (100 - exportsProgressPercentage) / 100)
        );

        exportProgressesButton.classList.toggle("exportsDone", exportsProgressPercentage >= 100);
        exportProgressesButton.classList.toggle("exportsFailed", exportInformation.anyExportFailed);

        if (projects.length === 1) {
            exportDestination.textContent = projects[0].name;
            exports.forEach(addExportProgress(exportProgresses));
        } else {
            exportDestination.textContent = "Zeplin";
            projects.forEach(addProject);
            exports.forEach(addExportProgress());
        }
    }

    function unsubscribeFromExportsChange() {
        ipcRenderer.removeAllListeners(EXPORTS_CHANGE_CHANNEL);
    }

    function subscribeToExportsChange() {
        ipcRenderer.on(EXPORTS_CHANGE_CHANNEL, handleExportsChange);
        ipcRenderer.send(SUBSCRIBE_TO_EXPORTS_CHANNEL);
    }

    function hideExportProgressesContainer() {
        exportProgressesContainer.classList.add("hidden");
    }

    ipcRenderer.on(EXPORTS_STARTED_CHANNEL, function () {
        notificationContainer.classList.add("hidden");
        userMenu.classList.add("hidden");
        exportProgressesButton.classList.remove("hidden");
        if (hasWebviewsFeature) {
            ipcRenderer.once("active", function (ev, active) {
                exportProgressesContainer.classList.toggle("hidden", !active);
            });
            ipcRenderer.sendToHost("active");
        } else {
            exportProgressesContainer.classList.remove("hidden");
        }
    });

    exportProgressesContainer.addEventListener("click", handleExportProgressesClick);

    exportProgressesButton.addEventListener("click", function (ev) {
        ev.stopPropagation();
        notificationContainer.classList.add("hidden");
        userMenu.classList.add("hidden");
        exportProgressesContainer.classList.toggle("hidden");
    });

    exportProgresses.addEventListener("transitionend", function (ev) {
        if (ev.target.id === exportProgresses.id && ev.propertyName === "height") {
            var allExportProgresses = exportProgresses.querySelectorAll(".exportProgress");
            var doneExportProgresses = exportProgressesContainer.querySelectorAll(".exportProgress.exportProgressDone, " +
                ".exportProgress.exportProgressFailed");
            if (allExportProgresses.length === doneExportProgresses.length) {
                exportProgressesContainer.classList.add("hidden");
            }
            subscribeToExportsChange();
        }
    });

    clearExportProgresses.addEventListener("click", function (ev) {
        ev.preventDefault();

        var doneExportProgresses = exportProgressesContainer.querySelectorAll(".exportProgress.exportProgressDone, " +
            ".exportProgress.exportProgressFailed");
        if (doneExportProgresses.length > 0) {
            unsubscribeFromExportsChange();
        }

        var delay = 0;

        function removeProgressFromDOM(event) {
            if (event.propertyName === "height") {
                event.target.remove();
            }
        }

        exportProgresses.style.height = exportProgresses.clientHeight + "px";

        for (var i = doneExportProgresses.length - 1; i > -1; i--) {
            var doneExportProgress = doneExportProgresses[i];
            doneExportProgress.addEventListener("transitionend", removeProgressFromDOM);
            doneExportProgress.style.transitionDelay = delay + "ms";
            doneExportProgress.classList.add("clearExportProgress");
            delay = delay + EXPORT_PROGRESS_CLEAR_INCREMENTAL_DELAY;
        }

        var finalDelay = delay - EXPORT_PROGRESS_CLEAR_INCREMENTAL_DELAY;

        exportProgresses.style.transitionDuration = (finalDelay +
            EXPORT_PROGRESS_CLEAR_DURATION + EXPORT_PROGRESSES_RESIZE_DELAY) + "ms";
        exportProgresses.style.height = (exportProgresses.clientHeight -
            (doneExportProgresses.length * EXPORT_PROGRESS_HEIGHT)) + "px";

        ipcRenderer.send("clear-exports");
    });

    document.addEventListener("click", function (ev) {
        if (ev.button === Zeplin.MOUSE_BUTTON.LEFT) {
            hideExportProgressesContainer();
        }
    });

    document.addEventListener("keydown", function (ev) {
        if (ev.keyCode === Zeplin.KEY_CODE.ESC) {
            hideExportProgressesContainer();
        }
    });

    subscribeToExportsChange();

    Array.from(document.querySelectorAll("#exportProgressesButton circle")).forEach(function (c) {
        c.setAttribute("r", EXPORTS_PROGRESS_RADIAL);
    });
    exportsProgressBar.setAttribute("stroke-dasharray", "0 " + EXPORTS_PROGRESS_BAR_CIRCUMFERENCE);

    window.ExportProgresses = {
        hideExportProgressesContainer: hideExportProgressesContainer
    };
})();
