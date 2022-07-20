# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "users#index"
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
