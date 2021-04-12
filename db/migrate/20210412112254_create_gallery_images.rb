class CreateGalleryImages < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_images do |t|
      t.integer :gallery_id, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
