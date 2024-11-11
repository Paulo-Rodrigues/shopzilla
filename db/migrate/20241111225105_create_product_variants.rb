class CreateProductVariants < ActiveRecord::Migration[8.0]
  def change
    create_table :product_variants do |t|
      t.references :product, null: false, foreign_key: true
      t.string :variant_type
      t.string :variant_value
      t.integer :stock

      t.timestamps
    end
    add_index :product_variants, :stock
  end
end
