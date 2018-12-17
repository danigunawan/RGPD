class Choice < ApplicationRecord
  belongs_to :user
  belongs_to :unsubscription

#  validates_uniqueness_of :user_id , scope: :unsubscription_id
end
