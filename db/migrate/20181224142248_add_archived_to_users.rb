class AddArchivedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :archived, :boolean
  end
end
