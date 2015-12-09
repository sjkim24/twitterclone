Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :tweets, except: [:edit, :update]
  resources :follows, only: [:index, :create, :new, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show]
    resources :tweets, except: [:edit, :update]
    resources :follows, only: [:index, :create, :new, :destroy]
  end
end
