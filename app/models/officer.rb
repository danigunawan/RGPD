class Officer < ApplicationRecord
  has_secure_password

  #validate :correct_code
  validates :email, presence: true, uniqueness: true

  private
if false
  def correct_code
    code = params[:code]
    if !Token.find_by_secret(code)
      errors.add("", "Mauvais code.")
    end
  end
end
end
