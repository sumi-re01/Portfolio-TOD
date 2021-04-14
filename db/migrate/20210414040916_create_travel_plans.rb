class CreateTravelPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_plans do |t|
      t.integer :itinerary_id, null: false
      t.string :text, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
