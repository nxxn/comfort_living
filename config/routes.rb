Rails.application.routes.draw do
  root "main#index"

  get 'divani', to: 'divani#index'
  get 'letti', to: 'letti#index'
  get 'poltrone', to: 'poltrone#index'
  get 'materassi', to: 'divani#index'

  get 'chi_siamo', to: 'main#chi_siamo'
  get 'dove_siamo', to: 'main#dove_siamo'

  #Divani Design
  get 'divani/design/alexander', to: 'divani#design_alexander', as: 'design_alexander'
  get 'divani/design/damasco', to: 'divani#design_damasco', as: 'design_damasco'
  get 'divani/design/boston', to: 'divani#design_boston', as: 'design_boston'
  get 'divani/design/siria', to: 'divani#design_siria', as: 'design_siria'
  get 'divani/design/taormina_angolare', to: 'divani#design_taormina_angolare', as: 'design_taormina_angolare'
  get 'divani/design/taormina_lineare', to: 'divani#design_taormina_lineare', as: 'design_taormina_lineare'
  get 'divani/design/vienna', to: 'divani#design_vienna', as: 'design_vienna'
  get 'divani/design/maya', to: 'divani#design_maya', as: 'design_maya'
  get 'divani/design/mambo', to: 'divani#design_mambo', as: 'design_mambo'
  get 'divani/design/samanta_lineare', to: 'divani#design_samanta_lineare', as: 'design_samanta_lineare'
  get 'divani/design/samanta_angolare', to: 'divani#design_samanta_angolare', as: 'design_samanta_angolare'
end
