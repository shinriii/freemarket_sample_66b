Rails.application.routes.draw do
  resources :comment, only: :index
  root to: 'comments#index'
end
