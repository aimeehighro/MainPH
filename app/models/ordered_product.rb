# frozen_string_literal: true

class OrderedProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :colour, :size, presence: true
  validates :quantity, :discount_rate, numericality: true
  validates :quantity, :discount_rate, numericality: { only_integer: true }
end
