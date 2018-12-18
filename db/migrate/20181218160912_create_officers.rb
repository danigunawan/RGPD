class CreateOfficers < ActiveRecord::Migration[5.2]
  def change
    create_table :officers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :officers, :email, unique: true
  end
end
