Rails.application.routes.draw do
  get 'users/show'
  resources :events
  devise_for :users
  resources :users, only: [:index, :show]
  root "home#index"
end
