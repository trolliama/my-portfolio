class RemoveDemoLinkFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :demo_link, :string
  end
end
