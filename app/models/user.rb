class User < ApplicationRecord
  has_many :choices
  has_many :unsubscriptions, through: :choices
  accepts_nested_attributes_for :choices

  has_one :request
  has_one :modification, dependent: :destroy

  before_save :assign_unsubs, :capitalize_name
  before_destroy :destroy_unsub


  validates :request_id,
  presence: { message: "Vous devez choisir un type de requête." }

  def assign_unsubs
    Unsubscription.all.each do |unsub|
      if !self.unsubscriptions.exists?(unsub.id)
        self.unsubscriptions << unsub
      end
    end
  end

  def capitalize_name
    self.surname.capitalize!
    self.name.capitalize!
  end

  def self.search(term)
    if term
      where('surname LIKE ?', "%#{term.capitalize}%").order('id DESC')
    else
      order('id DESC')
    end
  end

  def destroy_unsub
    self.unsubscriptions.destroy_all
  end
end
