class CreateTravels < ActiveRecord::Migration[5.2]
  def change
    create_table :travels do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
