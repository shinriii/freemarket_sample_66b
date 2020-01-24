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
 
  root 'items#index'  # ログインor新規登録を選ぶページ
  resources :items, only: :new  # 新規登録方法を選ぶページ


  resources :signup do
    collection do
      get 'index'
      get 'done' 
    end
  end

  resources :mypages, only: [:index] do
    get 'logout', to: 'mypage#logout'
  end
  
  root 'items#index'
  get 'items/new', to: 'items#new'
  
end
