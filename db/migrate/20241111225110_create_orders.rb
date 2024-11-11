class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.decimal :total, precision: 10, scale: 2
      t.integer :payment_status

      t.timestamps
    end
    add_index :orders, :status
    add_index :orders, :payment_status
  end
end
