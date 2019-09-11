Rails.application.routes.draw do
  root "home#index"
  resources :events do
    collection do
      get :search
    end
  end
  devise_for :users
  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
      get :participations
      get :clips
    end
    collection do
      get :search
    end
  end
  namespace "api" do
    resources :follow_relations, only: [:create, :destroy]
    resources :participations, only: [:create, :destroy]
    resources :clips, only: [:create, :destroy]
  end
end
