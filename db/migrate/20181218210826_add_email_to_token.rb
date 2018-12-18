class AddEmailToToken < ActiveRecord::Migration[5.2]
  def change
    add_column :tokens, :email, :string
  end
end
