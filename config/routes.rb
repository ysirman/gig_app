# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  get "/about", to: "home#about"
  get "/disclaimer", to: "home#disclaimer"

  resources :events do
    member do
      get :fix, to: "events/fix#update"
    end
    collection do
      get :search
    end
    resources :comments, only: [:index, :create]
  end

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }
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
    resources :participations, only: [:create, :destroy] do
      collection do
        put :fix, to: "participations/fix#update"
      end
    end
    resources :clips, only: [:create, :destroy]
  end
end
