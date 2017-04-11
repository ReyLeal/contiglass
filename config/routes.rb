Rails.application.routes.draw do

  get 'emails/new'

  get 'emails/create'

  get 'glass_floors/index'

  get 'metal_railings/index'

  get 'metal_fabrications/index'

  get 'glass_stairs/index'

  get 'glass_railings/index'

  get 'glass_elevators/index'

  get 'all_photos/index'

  get 'glass_wine_rooms/index'

  get 'glass_windows_doors/index'

  get 'glass_shower_doors/index'

  get 'other_glass_structures/index'

  get 'contact', to: 'emails#new', as: 'contact'

  post 'contact', to: 'emails#create'

  resources :photos
  root 'photos#homepage'

end
