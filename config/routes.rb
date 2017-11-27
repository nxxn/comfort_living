Rails.application.routes.draw do
  root "main#index"

  get 'divani', to: 'divani#index'
  get 'letti', to: 'letti#index'
  get 'letti/moderno', to: 'letti#moderno', as: 'letto_moderno'
  get 'letti/classico', to: 'letti#classico', as: 'letto_classico'
  get 'poltrone', to: 'poltrone#index'
  get 'materassi', to: 'materassi#index'

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

  #Divani Relax
  get 'divani/relax/murano_penisola', to: 'divani#relax_murano_penisola', as: 'relax_murano_penisola'
  get 'divani/relax/comfort_angolare', to: 'divani#relax_comfort_angolare', as: 'relax_comfort_angolare'
  get 'divani/relax/serena_angolare', to: 'divani#relax_serena_angolare', as: 'relax_serena_angolare'
  get 'divani/relax/murano', to: 'divani#relax_murano', as: 'relax_murano'
  get 'divani/relax/serena', to: 'divani#relax_serena', as: 'relax_serena'
  get 'divani/relax/panama', to: 'divani#relax_panama', as: 'relax_panama'
  get 'divani/relax/linda', to: 'divani#relax_linda', as: 'relax_linda'
  get 'divani/relax/comfort', to: 'divani#relax_comfort', as: 'relax_comfort'

  #Divani Letto
  get 'divani/letto/twin', to: 'divani#letto_twin', as: 'letto_twin'
  get 'divani/letto/comodo', to: 'divani#letto_comodo', as: 'letto_comodo'
  get 'divani/letto/venezia', to: 'divani#letto_venezia', as: 'letto_venezia'

  #Letti Moderno
  get 'letti/moderno/matrimoniale-stromboli', to: 'letti#matrimoniale_stromboli', as: 'matrimoniale_stromboli'

  get 'letti/moderno/matrimoniale-roma', to: 'letti#matrimoniale_roma', as: 'matrimoniale_roma'

  get 'letti/moderno/matrimoniale-chamonix', to: 'letti#matrimoniale_chamonix', as: 'matrimoniale_chamonix'

  get 'letti/moderno/matrimoniale-elba', to: 'letti#matrimoniale_elba', as: 'matrimoniale_elba'

  get 'letti/moderno/asolo', to: 'letti#asolo', as: 'asolo'

  get 'letti/moderno/matrimoniale-sardegna', to: 'letti#matrimoniale_sardegna', as: 'matrimoniale_sardegna'

  get 'letti/moderno/ponza', to: 'letti#ponza', as: 'ponza'

  get 'letti/moderno/matrimoniale-giglio', to: 'letti#matrimoniale_giglio', as: 'matrimoniale_giglio'

  get 'letti/moderno/matrimoniale-maddalena', to: 'letti#matrimoniale_maddalena', as: 'matrimoniale_maddalena'

  get 'letti/moderno/sicilia', to: 'letti#sicilia', as: 'sicilia'

  get 'letti/moderno/panarea', to: 'letti#panarea', as: 'panarea'

  get 'letti/moderno/capri', to: 'letti#capri', as: 'capri'

  get 'letti/moderno/matrimoniale-sommier', to: 'letti#matrimoniale_sommier', as: 'matrimoniale_sommier'

  get 'letti/moderno/king-size-stromboli', to: 'letti#king_size_stromboli', as: 'king_size_stromboli'

  get 'letti/moderno/king-size-roma', to: 'letti#king_size_roma', as: 'king_size_roma'

  get 'letti/moderno/king-size-elba', to: 'letti#king_size_elba', as: 'king_size_elba'

  get 'letti/moderno/king-size-sardegna', to: 'letti#king_size_sardegna', as: 'king_size_sardegna'

  get 'letti/moderno/king-size-giglio', to: 'letti#king_size_giglio', as: 'king_size_giglio'

  get 'letti/moderno/piazza-e-mezza_chamonix', to: 'letti#piazza_e_mezza_chamonix', as: 'piazza_e_mezza_chamonix'

  get 'letti/moderno/piazza-e-mezza-stromboli', to: 'letti#piazza_e_mezza_stromboli', as: 'piazza_e_mezza_stromboli'

  get 'letti/moderno/piazza-e-mezza-maddalena', to: 'letti#piazza_e_mezza_maddalena', as: 'piazza_e_mezza_maddalena'

  get 'letti/moderno/piazza-e-mezza-sardegna', to: 'letti#piazza_e_mezza_sardegna', as: 'piazza_e_mezza_sardegna'

  get 'letti/moderno/piazza-e-mezza-sommier', to: 'letti#piazza_e_mezza_sommier', as: 'piazza_e_mezza_sommier'

  get 'letti/moderno/singolo-chamonix', to: 'letti#singolo_chamonix', as: 'singolo_chamonix'

  get 'letti/moderno/singolo-stromboli', to: 'letti#singolo_stromboli', as: 'singolo_stromboli'

  get 'letti/moderno/singolo-maddalena', to: 'letti#singolo_maddalena', as: 'singolo_maddalena'

  get 'letti/moderno/singolo-sommier', to: 'letti#singolo_sommier', as: 'singolo_sommier'

  get 'letti/moderno/singolo-sardegna', to: 'letti#singolo_sardegna', as: 'singolo_sardegna'

  #Letti Classico
  get 'letti/classico/matrimoniale_tiffany', to: 'letti#matrimoniale_tiffany', as: 'matrimoniale_tiffany'

  get 'letti/classico/matrimoniale-anna', to: 'letti#matrimoniale_anna', as: 'matrimoniale_anna'

  get 'letti/classico/matrimoniale-lucy', to: 'letti#matrimoniale_lucy', as: 'matrimoniale_lucy'

  get 'letti/classico/matrimoniale-penelope', to: 'letti#matrimoniale_penelope', as: 'matrimoniale_penelope'

  get 'letti/classico/matrimoniale-grace', to: 'letti#matrimoniale_grace', as: 'matrimoniale_grace'

  get 'letti/classico/gardenia', to: 'letti#gardenia', as: 'gardenia'

  get 'letti/classico/matrimoniale-victoria', to: 'letti#matrimoniale_victoria', as: 'matrimoniale_victoria'

  get 'letti/classico/matrimoniale_alicia', to: 'letti#matrimoniale_alicia', as: 'matrimoniale_alicia'

  get 'letti/classico/matrimoniale_katherine', to: 'letti#matrimoniale_katherine', as: 'matrimoniale_katherine'

  get 'letti/classico/matrimoniale_greta', to: 'letti#matrimoniale_greta', as: 'matrimoniale_greta'

  get 'letti/classico/matrimoniale_elizabeth', to: 'letti#matrimoniale_elizabeth', as: 'matrimoniale_elizabeth'

  get 'letti/classico/matrimoniale_anita', to: 'letti#matrimoniale_anita', as: 'matrimoniale_anita'

  get 'letti/classico/matrimoniale_ingrid', to: 'letti#matrimoniale_ingrid', as: 'matrimoniale_ingrid'

  get 'letti/classico/matrimoniale_veronica', to: 'letti#matrimoniale_veronica', as: 'matrimoniale_veronica'

  get 'letti/classico/cameron', to: 'letti#cameron', as: 'cameron'

  get 'letti/classico/hilary', to: 'letti#hilary', as: 'hilary'

  get 'letti/classico/sabrina', to: 'letti#sabrina', as: 'sabrina'

  get 'letti/classico/amy', to: 'letti#amy', as: 'amy'

  get 'letti/classico/cora', to: 'letti#cora', as: 'cora'

  get 'letti/classico/jennifer', to: 'letti#jennifer', as: 'jennifer'

  get 'letti/classico/norah', to: 'letti#norah', as: 'norah'

  get 'letti/classico/piazza-e-mezza-grace', to: 'letti#piazza_e_mezza_grace', as: 'piazza_e_mezza_grace'

  get 'letti/classico/piazza-e-mezza-victoria', to: 'letti#piazza_e_mezza_victoria', as: 'piazza_e_mezza_victoria'

  get 'letti/classico/piazza-e-mezza-lucy', to: 'letti#piazza_e_mezza_lucy', as: 'piazza_e_mezza_lucy'

  get 'letti/classico/piazza-e-mezza-katherine', to: 'letti#piazza_e_mezza_katherine', as: 'piazza_e_mezza_katherine'

  get 'letti/classico/piazza-e-mezza-veronica', to: 'letti#piazza_e_mezza_veronica', as: 'piazza_e_mezza_veronica'

  get 'letti/classico/piazza-e-mezza-alicia', to: 'letti#piazza_e_mezza_alicia', as: 'piazza_e_mezza_alicia'

  get 'letti/classico/singolo-katherine', to: 'letti#singolo_katherine', as: 'singolo_katherine'

  get 'letti/classico/singolo-grace', to: 'letti#singolo_grace', as: 'singolo_grace'

  get 'letti/classico/singolo-lucy', to: 'letti#singolo_lucy', as: 'singolo_lucy'

  get 'letti/classico/singolo-victoria/', to: 'letti#singolo_victoria', as: 'singolo_victoria'

  get 'letti/classico/singolo-ingrid', to: 'letti#singolo_ingrid', as: 'singolo_ingrid'

  get 'letti/classico/singolo-veronica', to: 'letti#singolo_veronica', as: 'singolo_veronica'

  get 'letti/classico/singolo-greta', to: 'letti#singolo_greta', as: 'singolo_greta'

  #Portlone

  get 'poltrone/maiorca', to: 'poltrone#maiorca', as: 'maiorca'
  get 'poltrone/santiago', to: 'poltrone#santiago', as: 'santiago'
  get 'poltrone/salisburgo', to: 'poltrone#salisburgo', as: 'salisburgo'
  get 'poltrone/baltimora', to: 'poltrone#baltimora', as: 'baltimora'
  get 'poltrone/merida', to: 'poltrone#merida', as: 'merida'
  get 'poltrone/florida', to: 'poltrone#florida', as: 'florida'
  get 'poltrone/nevada', to: 'poltrone#nevada', as: 'nevada'
  get 'poltrone/citymap', to: 'poltrone#citymap', as: 'citymap'
  get 'poltrone/marsiglia', to: 'poltrone#marsiglia', as: 'marsiglia'

  #Materassi economic
  get 'materassi/economic/excellent', to: 'materassi#excellent', as: 'excellent'
  get 'materassi/economic/platinum', to: 'materassi#platinum', as: 'platinum'
  get 'materassi/economic/lucent', to: 'materassi#lucent', as: 'lucent'
  get 'materassi/economic/prince', to: 'materassi#prince', as: 'prince'
  get 'materassi/economic/sublime-natura', to: 'materassi#sublime_natura', as: 'sublime_natura'
  get 'materassi/economic/sublime-gold', to: 'materassi#sublime_gold', as: 'sublime_gold'
  get 'materassi/economic/sublime-silver', to: 'materassi#sublime_silver', as: 'sublime_silver'
  get 'materassi/economic/sublime-lusso', to: 'materassi#sublime_lusso', as: 'sublime_lusso'
  get 'materassi/economic/sublime-elegance', to: 'materassi#sublime_elegance', as: 'sublime_elegance'

  #Materassi spring
  get 'materassi/spring/de-luxe', to: 'materassi#de_luxe', as: 'de_luxe'
  get 'materassi/spring/grandeur', to: 'materassi#grandeur', as: 'grandeur'
  get 'materassi/spring/galaxy', to: 'materassi#galaxy', as: 'galaxy'
  get 'materassi/spring/extra', to: 'materassi#extra', as: 'extra'
  get 'materassi/spring/export', to: 'materassi#export', as: 'export'

  #Materassi memory
  get 'materassi/memory/luxor', to: 'materassi#luxor', as: 'luxor'
  get 'materassi/memory/ergo-memory', to: 'materassi#ergo_memory', as: 'ergo_memory'
  get 'materassi/memory/zefiro', to: 'materassi#zefiro', as: 'zefiro'
  get 'materassi/memory/oceano', to: 'materassi#oceano', as: 'oceano'
  get 'materassi/memory/lis', to: 'materassi#lis', as: 'lis'
  get 'materassi/memory/gris', to: 'materassi#gris', as: 'gris'
  get 'materassi/memory/olim', to: 'materassi#olim', as: 'olim'
  get 'materassi/memory/es', to: 'materassi#es', as: 'es'

  #Materassi foam
  get 'materassi/foam/moros', to: 'materassi#moros', as: 'moros'
  get 'materassi/foam/salus', to: 'materassi#salus', as: 'salus'
  get 'materassi/foam/acar', to: 'materassi#acar', as: 'acar'
  get 'materassi/foam/ares', to: 'materassi#ares', as: 'ares'

  #Materassi foam
  get 'materassi/latex/ecoform', to: 'materassi#ecoform', as: 'ecoform'
  get 'materassi/latex/ecosin', to: 'materassi#ecosin', as: 'ecosin'
  get 'materassi/latex/ecobase', to: 'materassi#ecobase', as: 'ecobase'
  get 'materassi/latex/ecogreen', to: 'materassi#ecogreen', as: 'ecogreen'
  get 'materassi/latex/ecogen', to: 'materassi#ecogen', as: 'ecogen'

  #Materassi fireproof
  get 'materassi/fireproof/sublime', to: 'materassi#sublime', as: 'sublime'
  get 'materassi/fireproof/resort', to: 'materassi#resort', as: 'resort'
  get 'materassi/fireproof/hc', to: 'materassi#hc', as: 'hc'
  get 'materassi/fireproof/h_2000', to: 'materassi#h_2000', as: 'h_2000'

  #Materassi presidio
  get 'materassi/presidio/medical', to: 'materassi#medical', as: 'medical'
  get 'materassi/presidio/sanity', to: 'materassi#sanity', as: 'sanity'

end
