Rails.application.routes.draw do

  devise_for :users
  root to: "articles#index"
  resources :articles, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users do
    resource :follows, only: [:create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
  end

  resources :users, only: %i[new create]
    resources :articles do
      resources :favorites, only: :index
    end
  resources :favorites, only: %i[create destroy]

  resources :users, only: [:index, :show]

end
