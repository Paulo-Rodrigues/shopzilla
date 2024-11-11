class CreateShippings < ActiveRecord::Migration[8.0]
  def change
    create_table :shippings do |t|
      t.references :order, null: false, foreign_key: true
      t.references :shipping_zone, null: false, foreign_key: true
      t.string :method
      t.decimal :rate, precision: 5, scale: 2

      t.timestamps
    end
  end
end
