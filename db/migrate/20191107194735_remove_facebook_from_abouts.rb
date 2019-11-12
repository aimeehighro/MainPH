class RemoveFacebookFromAbouts < ActiveRecord::Migration[6.0]
  def change

    remove_column :abouts, :facebook, :string
  end
end
