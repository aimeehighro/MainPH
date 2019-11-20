# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :province
  validates :first_name, :last_name, :street, :city, :postal_code, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
