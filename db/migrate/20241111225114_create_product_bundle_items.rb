class CreateProductBundleItems < ActiveRecord::Migration[8.0]
  def change
    create_table :product_bundle_items do |t|
      t.references :product_bundle, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
