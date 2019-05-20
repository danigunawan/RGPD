class RemoveRequestIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :request_id
  end
end
