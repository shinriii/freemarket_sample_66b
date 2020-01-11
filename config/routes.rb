Rails.application.routes.draw do
  resources :comments
  root to: 'tests#index'
end
