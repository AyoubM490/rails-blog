# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  # root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
