class DropUsersRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :request
  end
end
