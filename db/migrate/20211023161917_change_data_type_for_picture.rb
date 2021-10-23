class ChangeDataTypeForPicture < ActiveRecord::Migration[6.1]
  def change
    change_column :profiles, :picture, :string
  end
end
