class Officer < ApplicationRecord
  has_secure_password

  attr_accessor :remember_token
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

VALID_PASSWORD_REGEX = /\A
   (?=.*\d)           # Must contain a digit
   (?=.*[a-z])        # Must contain a lower case character
   (?=.*[A-Z])        # Must contain an upper case character
   (?=.*[[:^alnum:]]) # Must contain a symbol
 /x
  before_save { self.email = email.downcase }
  validates :email, presence: true, uniqueness: true,
                        length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 8 },
                format: { with: VALID_PASSWORD_REGEX }

# Returns the hash digest of the given string.
def Officer.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                              BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end

# Returns a random token
  def Officer.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Officer.new_token
    update_attribute(:remember_digest, Officer.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

# Forgets an officer
  def forget
    update_attribute(:remember_digest, nil)
  end
end
