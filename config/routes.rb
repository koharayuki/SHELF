Rails.application.routes.draw do

  devise_for :users
  root to: "articles#index"

  resources :users do
    resource :follows, only: [:create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
    resources :articles do
      resources :favorites, only: :index
    end
  end
  resources :favorites, only: [:create, :destroy]

  resources :articles do
    resources :users, only: [:show]
  end
end
