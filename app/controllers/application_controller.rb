# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_session
  before_action :increment_visit_count
  before_action :load_cart
  add_breadcrumb 'Home', :root_path

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name street city area
                                                         postal_code province_id])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name street city
                                                                area postal_code province_id])
  end

  private

  def initialize_session
    session[:visit_count] ||= 0
    session[:cart] ||= []
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

  def load_cart
    # Extract all the product ids from the array of hashes.
    @cart = session[:cart].map { |p| { product: Product.find(p['id']), quantity: p['quantity'] } }
    # @cart = Product.find(product_ids)
  end
end
