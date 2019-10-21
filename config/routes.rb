# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  get "/about", to: "home#about"
  get "/disclaimer", to: "home#disclaimer"

  resources :events do
    collection do
      get :search
    end
  end
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
      get :participations
      get :clips
      get :events
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
