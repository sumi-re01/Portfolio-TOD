class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.integer :user_id
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps
    end
  end
end
