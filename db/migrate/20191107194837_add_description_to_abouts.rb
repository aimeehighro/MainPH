class AddDescriptionToAbouts < ActiveRecord::Migration[6.0]
  def change
    add_column :abouts, :description, :text
  end
end
