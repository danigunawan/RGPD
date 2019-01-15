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

  def forget(officer)
    officer.forget
    cookies.delete(:officer_id)
    cookies.delete(:remember_token)
  end

  def logged_in?
    !current_officer.nil?
  end
  def log_out
    forget(current_officer)
    session.delete(:officer_id)
    @current_officer = nil
  end
end
