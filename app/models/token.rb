class Token < ApplicationRecord
  before_save :generate_secret

  def generate_secret
    self.secret = SecureRandom.hex(32)
  end
end
