class AddRememberDigestToOfficers < ActiveRecord::Migration[5.2]
  def change
    add_column :officers, :remember_digest, :string
  end
end
