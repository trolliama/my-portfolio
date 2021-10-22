class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.text :resume
      t.text :career_path
      t.text :picture

      t.timestamps
    end
  end
end
