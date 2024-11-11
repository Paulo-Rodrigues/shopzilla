class CreateInventories < ActiveRecord::Migration[8.0]
  def change
    create_table :inventories do |t|
      t.references :product_variant, null: false, foreign_key: true
      t.integer :quantity
      t.integer :reserved

      t.timestamps
    end
  end
end
