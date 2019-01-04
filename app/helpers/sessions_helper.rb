module SessionsHelper
  def log_in(officer)
    session[:officer_id] = officer.id
  end

  def log_out
    session.delete(:officer_id)
    @current_officer = nil
  end
end
