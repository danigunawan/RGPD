class Officer < ApplicationRecord
  has_secure_password

 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

VALID_PASSWORD_REGEX = /\A
   (?=.*\d)           # Must contain a digit
   (?=.*[a-z])        # Must contain a lower case character
   (?=.*[A-Z])        # Must contain an upper case character
   (?=.*[[:^alnum:]]) # Must contain a symbol
 /x

  validates :email, presence: true, uniqueness: true,
                        length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 8 },
                format: { with: VALID_PASSWORD_REGEX }

# Returns a random token
  def Officer.new_token
    SecureRandom.urlsafe_base64
  end
end
