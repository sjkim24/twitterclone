Rails.application.routes.draw do
  # root to: 'tweet#index'
  resources :users, only: [:create, :new]
  resource :sessions, only: [:create, :new]
end
