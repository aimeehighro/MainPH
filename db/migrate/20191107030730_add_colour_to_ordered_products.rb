class AddColourToOrderedProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :ordered_products, :colour, :string
  end
end
