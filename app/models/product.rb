# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :ordered_products
  has_many :orders, through: :ordered_products

  validates :name, :price, :stock_quantity, :image, :description, presence: true
  validates :price, :stock_quantity, numericality: true
  validates :stock_quantity, numericality: { only_integer: true }
end
