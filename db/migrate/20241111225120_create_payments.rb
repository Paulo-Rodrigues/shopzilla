class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.integer :status
      t.datetime :payment_date

      t.timestamps
    end
    add_index :payments, :status
  end
end
