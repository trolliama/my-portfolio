class AddGifImageDataToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :gif_image_data, :text
  end
end
