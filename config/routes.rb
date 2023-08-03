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
  resources :cart_items, only: %i[index create destroy]
  root 'products#index'
end
