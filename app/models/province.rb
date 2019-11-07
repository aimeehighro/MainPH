# frozen_string_literal: true

class Province < ApplicationRecord
  has_many :customers
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :GST, :PST, :QST, :HST, numericality: true
end
