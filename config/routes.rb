Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :tweets, except: [:index, :show]
end
