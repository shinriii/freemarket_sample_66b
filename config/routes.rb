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
  resource :items do
    get '/items/new', to: 'items#new'
    post 'items', to: 'items#create' 
    get '/items', to: 'items#show'
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

  resources :buys, only: [:index] do
    get '/buys', to: 'buys#index'
  end

  resources :items, only: :show
end
