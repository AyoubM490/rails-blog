# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
