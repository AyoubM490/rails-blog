# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "users/sign_in" => "users#login"
      get "posts" => "posts#index"
      get "comments" => "comments#index"
      post "comments/create" => "comments#create"
    end
  end

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
