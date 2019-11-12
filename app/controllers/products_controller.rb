# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @pagy, @products = pagy(Product.all, items: 8)
  end

  def show
    @product = Product.find(params[:id])
  end
end
