class AddReasonSpecificToUnsubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :unsubscriptions, :reason_specific, :boolean
  end
end
