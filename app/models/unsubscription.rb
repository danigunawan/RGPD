class Unsubscription < ApplicationRecord
  belongs_to :user
  has_one :unsubscription_request
end
