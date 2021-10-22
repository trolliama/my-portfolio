class CreateProjectsLiksJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :projects_links, id: false do |t|
      t.belongs_to :project
      t.belongs_to :link
    end
  end
end
