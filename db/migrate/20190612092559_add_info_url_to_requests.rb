class AddInfoUrlToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :infoUrl, :string
  end
end
