class CreateAbouts < ActiveRecord::Migration[6.0]
  def change
    create_table :abouts do |t|
      t.string :title
      t.string :description
      t.string :email
      t.string :facebook
      t.string :ig

      t.timestamps
    end
  end
end
