class CreateVendors < ActiveRecord::Migration[8.0]
  def change
    create_table :vendors do |t|
      t.references :user, null: false, foreign_key: true
      t.float :rating
      t.integer :sales_count

      t.timestamps
    end
    add_index :vendors, :sales_count
  end
end
