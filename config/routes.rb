Rails.application.routes.draw do

  resources :tests, only: :index
  root to: 'tests#index'

  # resources :comments, only: :index
  # root to: 'comments#index'

end
