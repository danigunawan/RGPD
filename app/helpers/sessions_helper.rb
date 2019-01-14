module SessionsHelper
  def log_in(officer)
    session[:officer_id] = officer.id
  end

# Remembers officers in persistent sessions
  def remember(officer)
    officer.remember
    cookies.permanent.signed[:officer_id] = officer.id
    cookies.permanent[:remember_token] = officer.remember_token
  end

  def log_out
    session.delete(:officer_id)
    @current_officer = nil
  end
end
