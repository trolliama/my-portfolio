class CreateLinksProfilesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :links_profiles, id: false do |t|
      t.belongs_to :profile
      t.belongs_to :link
    end
  end
end
