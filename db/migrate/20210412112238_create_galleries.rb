class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      # travel1につきGalleryも１
      t.integer :user_id
      t.belongs_to :travel
      t.boolean :public_status, null: false, default: true
      t.string :text
      t.string :address
      t.float :latitude
      t.float :longitude
      t.json :images

      t.timestamps
    end
  end
end
