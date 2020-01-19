Rails.application.routes.draw do
  resources :comments, only: :index
  root to: 'comments#index'
end
