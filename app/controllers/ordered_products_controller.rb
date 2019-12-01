# frozen_string_literal: true

class OrderedProductsController < ApplicationController
  before_action :compute_sub_total
  before_action :authenticate_user!
  def index
    redirect_to root_path if session[:cart].count.zero?
    @user = current_user
    @province = Province.find(@user.province.id)
    # subtotal = compute_sub_total
    # puts 'HEY'
    @gst = @province.GST / 100
    @gst_total = @gst * @sub_total
    @pst = @province.PST / 100
    @pst_total = @pst * @sub_total
    @hst = @province.HST / 100
    @hst_total = @hst * @sub_total
    @qst = @province.QST / 100
    @qst_total = @qst * @sub_total
    @total = @sub_total + @gst_total + @pst_total + @hst_total + @qst_total
  end

  def compute_sub_total
    @sub_total = 0
    @cart.each do |p|
      # puts p[:product].id + params[:id].to_i
      @quantity = p[:quantity].to_i
      # puts 'AIMEEECHAN'
      # puts @quantity
      # puts p[:product].price.to_f * @quantity.to_i
      @sub_total += p[:product].price.to_f * @quantity.to_i
      # @sub_total += @quantity * p[:product].price.to_f
    end
    # puts @sub_total
  end

  def add_to_cart
    id = params[:id].to_i
    quantity = params[:quantity].to_i
    push_me = { 'id' => id, 'quantity' => quantity }
    session[:cart] << push_me unless session[:cart].include?(push_me)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete_if { |p| p['id'] == id }
    redirect_to ordered_products_index_path
  end

  def increment_qty
    @cart.each do |p|
      # puts p[:product].id + params[:id].to_i
      @quantity = p[:quantity].to_i if p[:product].id == params[:id].to_i
    end
    session[:cart].delete_if { |p| p['id'] == params[:id].to_i }
    session[:cart] << { 'id' => params[:id].to_i, 'quantity' => @quantity + 1 }
    redirect_to ordered_products_index_path
    # quantity = @cart.map { |p| p[:quantity] } unless @cart.map { |p| p[:product].id == params[:id].to_i }
    # if @cart.map { |p| p[:product].id == params[:id].to_i }
    #   quantity = @cart.map { |p| p[:quantity] }
    # end
  end

  def decrement_qty
    @cart.each do |p|
      # puts p[:product].id + params[:id].to_i
      @quantity = p[:quantity].to_i if p[:product].id == params[:id].to_i
    end
    if @quantity < 2
      # session[:cart].delete_if { |p| p['id'] == params[:id].to_i }
      # redirect_to ordered_products_index_path
      remove_from_cart
    else
      session[:cart].delete_if { |p| p['id'] == params[:id].to_i }
      session[:cart] << { 'id' => params[:id].to_i, 'quantity' => @quantity - 1 }
      redirect_to ordered_products_index_path
    end

    # quantity = @cart.map { |p| p['quantity'] }
    # if quantity.join.to_i < 2
    #   remove_from_cart
    # else
    #   session[:cart].delete_if { |p| p['id'] == params[:id].to_i }
    #   session[:cart] << { 'id' => params[:id].to_i, 'quantity' => quantity.join.to_i - 1 }
    #   redirect_to ordered_products_index_path
    # end
  end
end
