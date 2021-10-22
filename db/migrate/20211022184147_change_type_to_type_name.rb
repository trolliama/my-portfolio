class ChangeTypeToTypeName < ActiveRecord::Migration[6.1]
  def change
    rename_column :link_types, :type, :type_name
  end
end
