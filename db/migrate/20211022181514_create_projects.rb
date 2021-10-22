class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :resume_card
      t.text :body
      t.string :thumb_image
      t.string :main_image

      t.timestamps
    end
  end
end
