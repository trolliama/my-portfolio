class AddLinkTypeToLink < ActiveRecord::Migration[6.1]
  def change
    add_reference :links, :link_type, null: false, foreign_key: true
  end
end
