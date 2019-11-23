# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'contacts/index'
  get 'abouts/index'
  get 'ordered_products/index'
  post 'ordered_products/add_to_cart/:id', to: 'ordered_products#add_to_cart', as: 'add_to_cart'
  delete 'ordered_products/remove_from_cart/:id', to: 'ordered_products#remove_from_cart', as: 'remove_from_cart'
  # get 'products/index'
  # get 'products/show'

  resources :categories, only: %i[index show]
  resources :products, only: %i[index show]
  root to: 'products#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
