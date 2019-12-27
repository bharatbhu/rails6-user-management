class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :contact
      t.string :profile_image
      t.timestamps
    end
  end
end
