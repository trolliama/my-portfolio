class AddIconToLinkTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :link_types, :icon, :string
  end
end
