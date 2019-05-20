class AddUsersToModifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :modifications, :user, foreign_key: true
  end
end
