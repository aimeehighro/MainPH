# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :fetch_products, only: [:index]
  before_action :sort_products, only: [:index]
  def index
    @pagy, @products = if params[:search] || params[:category_id]
                         pagy(Product.search(params[:search],
                                             params[:category_id]), items: 4)
                       elsif params[:sort]
                         sort_products
                       else
                         fetch_products
                       end
  end

  def show
    @product = Product.find(params[:id])
    add_breadcrumb @product.category.name, category_path(@product.category.id)
    add_breadcrumb 'Product', :product_path
  end

  private

  def sort_products
    @pagy, @products = pagy(Product.order("#{params[:sort]} desc"), items: 4)
  end

  def fetch_products
    @pagy, @products = pagy(Product.all, items: 8)
  end
end
