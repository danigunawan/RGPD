class User < ApplicationRecord
  has_one :unsubscription
  has_one :user_unsubscription, through: :unsubscription

  validates :request, presence: { message: "Vous devez choisir un type de requête." }
end
