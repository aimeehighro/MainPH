# frozen_string_literal: true

Rails.application.routes.draw do
  get 'contacts/index'
  get 'abouts/index'
  # get 'products/index'
  # get 'products/show'

  resources :categories, only: %i[index show]
  resources :products, only: %i[index show]
  root to: 'products#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
