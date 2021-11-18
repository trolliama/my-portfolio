class AddPictureDataToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :picture_data, :text
  end
end
