Rails.application.routes.draw do
  root to: 'users#show'
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :tweets, except: [:index]
end
