# frozen_string_literal: true

class OrderedProductsController < ApplicationController
  def add_to_cart
    id = params[:id].to_i
    @quantity = params[:quantity].to_i
    push_me = { 'id' => id, 'quantity' => @quantity }
    session[:cart] << push_me unless session[:cart].include?(push_me)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete_if { |p| p['id'] == id }
    redirect_to ordered_products_index_path
  end

  # def increment_qty
  #   @quantity = session[:cart].map { |q| q['quantity'] }
  #   @quantity += 1
  #   push_me = { 'id' => id, 'quantity' => @quantity }
  #   session[:cart] << push_me
  #   redirect_to ordered_products_index_path
  # end

  # def decrement_qty
  #   @quantity = session[:cart].map { |q| q['quantity'] - 1 }
  # end
end
