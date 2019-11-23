# frozen_string_literal: true

class OrderedProductsController < ApplicationController
  def add_to_cart
    id = params[:id].to_i

    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end
  
  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to ordered_products_index_path
  end

end
