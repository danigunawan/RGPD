class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :zipcode

      t.timestamps
    end
  end
end
