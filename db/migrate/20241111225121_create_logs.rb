class CreateLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :action
      t.references :loggable, polymorphic: true, null: false
      t.text :details

      t.timestamps
    end
  end
end
