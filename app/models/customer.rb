# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :province
  has_many :payments
  has_many :orders, through: :payments

  validates :first_name, :last_name, :email, :password, :street, :city, :postal_code, presence: true
  validates :email, uniqueness: true
end
