Rails.application.routes.draw do
  root to: 'static_pages#root'
  resources :users, only: [:create, :new]
  resource :session, only: [:create, :new, :destroy]
  # resources :tweets, except: [:edit, :update]
  # resources :follows, only: [:index, :create, :new, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :show] do
      resources :follows, only: [:index]
    end
    resources :tweets, only: [:create, :index, :show, :destroy]
    resources :follows, only: [:index, :create, :destroy, :show]
    resource :current_user, only: [:show]
  end
end
