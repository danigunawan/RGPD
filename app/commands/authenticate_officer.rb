class AuthenticateOfficer
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(officer_id: officer.id) if officer
  end

  private

  attr_accessor :email, :password

  def officer
    officer = Officer.find_by_email(email)
    return officer if officer && officer.authenticate(password)

    errors.add :officer_authentication, 'invalid credentials'
    nil
  end
end
