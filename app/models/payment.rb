# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :customer
  belongs_to :order

  validates :credit_card, :amount, presence: true
  validates :credit_card, :amount, numericality: true
  validates :credit_card, numericality: { only_integer: true }
end
