class RemoveDescriptionFromAbouts < ActiveRecord::Migration[6.0]
  def change

    remove_column :abouts, :description, :string
  end
end
