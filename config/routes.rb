Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'items#index'
  resources :items do
    get 'new_item', to: 'items#new'
    post 'items', to: 'items#create' 
    get 'show', to: 'items#show'
    get 'confirm'
    post 'purchase'
    post 'done'
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren',defaults: { format: 'json' }
    end
  end

  resources :signup , only: [:index] do
      get '/signup/index', to:'signup#index'
  end

  resources :mypages, only: [:index] do
    get '/mypages', to: 'mypages#index'
  end

  resources :profiles, only: [:index] do
    get '/profiles', to: 'profiles#index'
  end

  resources :cards, only: [:index] do
    get '/cards', to: 'cards#index'
  end

  resources :identity_informations, only: [:index] do
    get '/identity_informations', to: 'identity_informations#index'
  end

  resources :cards, only: [:index] do
    get '/cards', to: 'cards#index'
  end

  resources :logouts, only: [:index] do
    get '/logouts', to: 'logouts#index'
  end
end

