class RenameSpecific < ActiveRecord::Migration[5.2]
  def change
    rename_column :unsubscriptions, :specific, :reason_specific
  end
end
