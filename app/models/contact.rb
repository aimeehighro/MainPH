class Contact < ApplicationRecord
  validates :title, :description, :email, :facebook, :ig, presence:true
end
