class Unsubscription < ApplicationRecord
  has_many :choices
  has_many :users, through: :choices
  accepts_nested_attributes_for :choices

  before_save :assign_users
  before_destroy :destroy_users


    def assign_users
    self.users << User.all
  end

  def destroy_users
    self.users.destroy_all
  end
end
