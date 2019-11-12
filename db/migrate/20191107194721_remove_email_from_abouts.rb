class RemoveEmailFromAbouts < ActiveRecord::Migration[6.0]
  def change

    remove_column :abouts, :email, :string
  end
end
