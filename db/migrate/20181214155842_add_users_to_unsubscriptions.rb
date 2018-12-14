class AddUsersToUnsubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :unsubscriptions, :user, foreign_key: true
  end
end
