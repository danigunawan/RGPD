class AddModificationsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :modification, foreign_key: true
  end
end
