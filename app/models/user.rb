class User < ApplicationRecord
  has_many :choices
  has_many :unsubscriptions, through: :choices
  accepts_nested_attributes_for :choices, :unsubscriptions

  has_one :request
  has_one :modification, dependent: :destroy

  before_save :assign_unsubs, :capitalize_name
  before_destroy :destroy_unsub

  validate :unsub_must_not_be_blank
  validates :request_id,
  presence: { message: "Vous devez choisir un type de requête." }



  def unsub_must_not_be_blank
    if self.request_id == 3
      pass  = false
      self.choices.each do |unsub|
        if unsub.completed == true
          pass = true
        end
      end
      if pass == false
        errors.add(:choice, "Vous devez sélectionner au moins un choix")
      end
    end
  end

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
