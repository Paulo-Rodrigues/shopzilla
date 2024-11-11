class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.references :order, null: false, foreign_key: true
      t.datetime :due_date
      t.decimal :total, precision: 10, scale: 2
      t.integer :status

      t.timestamps
    end
    add_index :invoices, :status
  end
end
