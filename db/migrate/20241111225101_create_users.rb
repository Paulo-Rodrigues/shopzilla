class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :role

      t.timestamps
    end
    add_index :users, :role
  end
end
