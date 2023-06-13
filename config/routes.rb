Rails.application.routes.draw do

  devise_for :users
  root to: "articles#index"
  resources :articles, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users do
    resource :follows, only: [:create, :destroy]
  end

  resources :users, only: %i[new create]
    resources :articles do
      collection do
        get :favorites
      end
    end
  resources :favorites, only: %i[create destroy]

  resources :users, only: [:index, :show]

end
