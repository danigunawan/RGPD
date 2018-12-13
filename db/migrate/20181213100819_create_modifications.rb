class CreateModifications < ActiveRecord::Migration[5.2]
  def change
    create_table :modifications do |t|
      t.string :name
      t.string :surname
      t.string :string
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :zipcode

      t.timestamps
    end
  end
end
