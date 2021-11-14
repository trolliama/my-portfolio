class AddTooltipForLinks < ActiveRecord::Migration[6.1]
  def change
    add_column :links, :tooltip, :string
  end
end
