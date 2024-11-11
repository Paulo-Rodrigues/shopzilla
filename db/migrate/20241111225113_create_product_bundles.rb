class CreateProductBundles < ActiveRecord::Migration[8.0]
  def change
    create_table :product_bundles do |t|
      t.string :name
      t.decimal :discount_value, precision: 5, scale: 2
      t.integer :discount_type

      t.timestamps
    end
  end
end
