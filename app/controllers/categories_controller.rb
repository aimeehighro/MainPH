# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    add_breadcrumb @category.name, :category_path
    @pagy, @products = pagy(Product.where(category_id: @category.id), items: 8)
  end
  # def show
  #   # @pagy, @products = if params[:product]
  #   #                      pagy(Product.where('name LIKE ?', "%#{params[:genre]}%"), items: 5)
  #   #                    else
  #   #                      pagy(Product.all, items: 5)
  #   # end
  #   @categories = Category.find(params[:id])
  #   # @products = Product.where(category_id: @categories.id)
  #   @pagy, @products = if params[:categories]
  #                        pagy(Product.where('name LIKE ?', "%#{params[:product]}%"), items: 5)
  #                      else
  #                        pagy(Product.all, items: 5)
  #   end
  # end
end
