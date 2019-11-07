class AddSizeToOrderedProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :ordered_products, :size, :string
  end
end
