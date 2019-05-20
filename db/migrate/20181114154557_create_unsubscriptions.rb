class CreateUnsubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :unsubscriptions do |t|
      t.string :kind

      t.timestamps
    end
  end
end
