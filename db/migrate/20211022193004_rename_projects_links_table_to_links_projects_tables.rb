class RenameProjectsLinksTableToLinksProjectsTables < ActiveRecord::Migration[6.1]
  def change
    rename_table :projects_links, :links_projects
  end
end
