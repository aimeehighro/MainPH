# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @pagy, @products = if params[:search]
                         pagy(Product.search(params[:search],
                                             params[:category_id]), items: 4)
                       elsif params[:sort]
                         pagy(Product.order("#{params[:sort]} desc"), items: 4)
                       else
                         pagy(Product.all, items: 8)
                       end
  end

  def show
    @product = Product.find(params[:id])
  end
end
