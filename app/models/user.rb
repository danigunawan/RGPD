class User < ApplicationRecord
  has_many :unsubscriptions
  has_one :request
  has_one :modification, dependent: :destroy

  accepts_nested_attributes_for :modification, :request
  validates :request_id,
        presence: { message: "Vous devez choisir un type de requête." }
        after_initialize do
          self.modification ||= self.build_modification()
        end
end
