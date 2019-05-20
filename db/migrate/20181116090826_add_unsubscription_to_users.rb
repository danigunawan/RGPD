class AddUnsubscriptionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :unsubscription, foreign_key: true
  end
end
