class Unsubscription < ApplicationRecord
  has_many :choices
  has_many :users, through: :choices
  accepts_nested_attributes_for :choices

  before_save :assign_users, :evaluate_specificity
  before_destroy :destroy_users


  def assign_users
    User.all.each do |user|
      if !self.users.exists?(user.id)
        self.users << user
      end
    end
  end

  def evaluate_specificity
    choice = self.choices.last
    if self.reason_specific
      choice.specific = true
      choice.completed = true
    end
  end

  def destroy_users
    self.users.destroy_all
  end
end
