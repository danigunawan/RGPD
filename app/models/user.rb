class User < ApplicationRecord
  has_one :unsubscription
  has_one :user_unsubscription, through: :unsubscription
  has_one :request
  has_one :modification, dependent: :destroy

  accepts_nested_attributes_for :modification
  validates :request_id, presence: { message: "Vous devez choisir un type de requête." }
end
