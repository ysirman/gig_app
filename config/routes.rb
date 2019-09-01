Rails.application.routes.draw do
  root "home#index"
  get 'users/show'
  resources :events
  devise_for :users
  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
  end
  namespace "api" do
    resources :follow_relations, only: [:create, :destroy]
    resources :participations, only: [:create, :destroy]
  end
end
