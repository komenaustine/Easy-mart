class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :image
      t.string :description
      t.string :category
      t.string :quantity
      t.timestamps
    end
  end
end
