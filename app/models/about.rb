class About < ApplicationRecord
  validates :title, :description, presence:true
end