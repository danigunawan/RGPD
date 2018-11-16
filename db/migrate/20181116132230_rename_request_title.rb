class RenameRequestTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :requests, :tite, :title
  end
end
