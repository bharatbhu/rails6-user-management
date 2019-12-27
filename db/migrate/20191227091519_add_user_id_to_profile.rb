class AddUserIdToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :user_id, :integer
    add_column :users, :profile_image, :string
  end
end
