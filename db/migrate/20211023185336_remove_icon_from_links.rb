class RemoveIconFromLinks < ActiveRecord::Migration[6.1]
  def change
    remove_column :links, :icon, :string
  end
end
