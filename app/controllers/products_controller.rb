# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @pagy, @products = if params[:search]
                         pagy(Product.search(params[:search],
                                             params[:category]),
                              items: 8)
                       else
                         pagy(Product.all, items: 8)
                       end
  end

  def show
    @product = Product.find(params[:id])
  end
end
