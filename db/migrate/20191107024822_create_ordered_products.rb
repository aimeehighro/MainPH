class CreateOrderedProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :ordered_products do |t|
      t.integer :quantity
      t.integer :discount_rate
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
