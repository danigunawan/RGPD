class Officer < ApplicationRecord
  has_secure_password

 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

VALID_PASSWORD_REGEX = /\A
   (?=.*\d)           # Must contain a digit
   (?=.*[a-z])        # Must contain a lower case character
   (?=.*[A-Z])        # Must contain an upper case character
   (?=.*[[:^alnum:]]) # Must contain a symbol
 /x

  validates :email, presence: {message: "Courriel requis."}, uniqueness: { message: "Ce courriel est déjà pris." },
                        length: { maximum: 255, message: "Courriel trop long" },
                    format: { with: VALID_EMAIL_REGEX, message: "Courriel invalide." }
  validates :password, presence: true, length: {minimum: 8, message: "Le mot de passe est trop court(doit faire au moins 8 caractères)."},
                format: { with: VALID_PASSWORD_REGEX, message: "Le mot de passe doit contenir: 1 chiffre, 1 minuscule, 1 majuscule, 1 caractère spécial." }
end
