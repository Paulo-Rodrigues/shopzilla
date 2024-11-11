class CreateShippingZones < ActiveRecord::Migration[8.0]
  def change
    create_table :shipping_zones do |t|
      t.string :name
      t.decimal :rate, precision: 5, scale: 2

      t.timestamps
    end
  end
end
