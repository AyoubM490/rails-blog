# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :new, :show]
  end

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end
end
