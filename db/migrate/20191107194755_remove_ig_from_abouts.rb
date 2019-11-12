class RemoveIgFromAbouts < ActiveRecord::Migration[6.0]
  def change

    remove_column :abouts, :ig, :string
  end
end
