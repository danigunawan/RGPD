class AddSpecificToChoices < ActiveRecord::Migration[5.2]
  def change
    add_column :choices, :specific, :boolean
  end
end
