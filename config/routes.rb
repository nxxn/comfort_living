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
end
