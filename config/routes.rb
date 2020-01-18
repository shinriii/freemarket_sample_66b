Rails.application.routes.draw do
  resources :comment
  root to: 'comments#index'
end
