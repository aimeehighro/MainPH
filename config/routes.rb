# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'contacts/index'
  get 'abouts/index'
  get 'ordered_products/index'
  post 'ordered_products/add_to_cart/:id', to: 'ordered_products#add_to_cart', as: 'add_to_cart'
  delete 'ordered_products/remove_from_cart/:id', to: 'ordered_products#remove_from_cart', as: 'remove_from_cart'
  post 'ordered_products/incremenet_qty/:id', to: 'ordered_products#increment_qty', as: 'increment_qty'
  post 'ordered_products/decerement_qty/:id', to: 'ordered_products#decrement_qty', as: 'decrement_qty'
  scope '/checkout' do
    get 'index', to: 'checkout#index', as: 'checkout_index'
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
  # get 'products/index'
  # get 'products/show'

  resources :categories, only: %i[index show]
  resources :products, only: %i[index show]
  root to: 'products#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
