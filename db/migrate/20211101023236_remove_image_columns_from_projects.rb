class RemoveImageColumnsFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :main_image, :string
    remove_column :projects, :thumb_image, :string
  end
end
