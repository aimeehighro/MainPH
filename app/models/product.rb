# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :ordered_products
  has_many :orders, through: :ordered_products

  validates :name, :price, :stock_quantity, :description, presence: true
  validates :price, :stock_quantity, numericality: true
  validates :stock_quantity, numericality: { only_integer: true }

  has_one_attached :image

  def self.search(search, category_id)
    # Title is for the above case, the OP incorrectly had 'name'
    where('name LIKE ? AND category_id = ?', "%#{search}%", category_id)
  end

  def thumbnail
    image.variant(resize: '300x300!').processed
  end

  def small
    image.variant(resize: '150x150!').processed
  end
end
