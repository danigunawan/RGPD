class User < ApplicationRecord
  has_many :choices
  has_many :unsubscriptions, through: :choices
  accepts_nested_attributes_for :choices, :unsubscriptions

 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  has_one :request
  has_one :modification, dependent: :destroy

  before_save :assign_unsubs, :capitalize_name
  after_save :assign_url
  before_destroy :destroy_unsub




  # All methods under this keyword are private
private

def assign_url
  self.infoUrl= self.request.infoUrl
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
      where('surname LIKE ?', "%#{term.capitalize}%").order('updated_at DESC')
    else
      order('updated_at DESC')
    end
  end

  def destroy_unsub
    self.unsubscriptions.destroy_all
  end
end
