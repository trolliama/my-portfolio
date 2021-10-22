class AddTitleToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :title, :string
  end
end
