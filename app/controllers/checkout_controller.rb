# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    # product = Product.find(params[:id])

    # if product.nil?
    #   redirect_to ordered_products_index_path
    #   return
    # end

    # @session = Stripe::Checkout::Session.create(
    #   payment_method_types: ['card'],
    #   line_items: [{
    #     name: product.name,
    #     description: product.description,
    #     amount: product.price_in_cents,
    #     currency: 'cad',
    #     quantity: 1
    #   }],
    #   success_url: checkout_success_url,
    #   cancel_url: checkout_cancel_url
    # )

    # respond_to do |format|
    #   format.js
    # end
  end

  def success; end

  def cancel; end
end
