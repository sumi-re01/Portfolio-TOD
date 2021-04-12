class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      # Itinerary１につきGalleryも１
      t.belongs_to :itinerary
      t.boolean :public_status, null: false
      t.string :text
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
