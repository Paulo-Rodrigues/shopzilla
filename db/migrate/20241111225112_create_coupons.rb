class CreateCoupons < ActiveRecord::Migration[8.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :discount_type
      t.decimal :discount_value, precision: 5, scale: 2
      t.datetime :expires_at
      t.integer :usage_limit

      t.timestamps
    end
    add_index :coupons, :code
  end
end
