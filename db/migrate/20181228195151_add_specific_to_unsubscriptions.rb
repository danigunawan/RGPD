class AddSpecificToUnsubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :unsubscriptions, :specific, :boolean
  end
end
