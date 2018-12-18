class User < ApplicationRecord
  has_many :choices
  has_many :unsubscriptions, through: :choices
  accepts_nested_attributes_for :choices

  has_one :request
  has_one :modification, dependent: :destroy

  before_save :assign_unsub
  before_destroy :destroy_unsub


  validates :request_id,
  presence: { message: "Vous devez choisir un type de requête." }
  
  def assign_unsub
    Unsubscription.all.each do |unsub|
      if !self.unsubscriptions.exists?(unsub.id)
        self.unsubscriptions << unsub
      end
    end
  end

  def destroy_unsub
    self.unsubscriptions.destroy_all
  end
end
