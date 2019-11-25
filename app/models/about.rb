# frozen_string_literal: true

class About < ApplicationRecord
  validates :title, :description, presence: true
end
