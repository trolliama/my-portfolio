class RemovePictureColumnFromProfile < ActiveRecord::Migration[6.1]
  def change
    remove_column :profiles, :picture, :string
  end
end
