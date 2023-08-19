# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "tasks#index"
  resources :products, only: %i[index show]
  namespace :admin do
    resources :products, except: %i[show]
  end
  resources :cart_items, only: %i[create update destroy]
  resources :orders, only: %i[index new create]
  resources :order_details, only: %i[index show]
  root 'products#index'
end
