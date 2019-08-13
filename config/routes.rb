Rails.application.routes.draw do
  get 'users/show'
  resources :events
  devise_for :users
  resources :users, only: [:show]
  root "home#index"
end
