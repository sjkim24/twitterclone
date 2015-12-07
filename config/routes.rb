Rails.application.routes.draw do
  # root to: 'tweet#index'
  resources :users, only: [:create, :new]
  resource :session, only: [:create, :new, :destroy]
end
