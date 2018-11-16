class User < ApplicationRecord
  has_one :request
  has_one :user_request, through: :request

  has_one :unsubscription
  has_one :user_unsubscription, through: :unsubscription
end
