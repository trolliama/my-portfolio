class CreateProfilesProjectsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles_projects, id: false do |t|
      t.belongs_to :profile
      t.belongs_to :project
    end
  end
end
