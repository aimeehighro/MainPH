# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :ordered_products
  has_many :products, through: :ordered_products
  has_many :payments
  has_many :customers, through: :payments

  validates :status, presence: true
end
