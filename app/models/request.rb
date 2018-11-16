class Request < ApplicationRecord
  belongs_to :user
  has_one :user_request
end
