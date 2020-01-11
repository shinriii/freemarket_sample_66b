Rails.application.routes.draw do
  resources :comments
  root to: 'comments#new'
end
