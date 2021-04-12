class CreateMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :marks do |t|
      t.integer :user_id, null: false
      t.integer :gallery_id, null: false

      t.timestamps
    end
    add_index :marks, [:user_id, :gallery_id], unique: true
  end
end
