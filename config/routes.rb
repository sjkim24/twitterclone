Rails.application.routes.draw do
  root to: 'sessionss#new'
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :tweets, except: [:index, :show]
end
