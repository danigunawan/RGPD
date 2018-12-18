class ApplicationController < ActionController::Base
  helper_method :current_officer
  before_action :login_required

  def current_officer
    if session[:officer_id]
      @current_officer ||= Officer.find(session[:officer_id])
    else
      @current_officer = nil
    end
  end

  def login_required
    redirect_to new_session_path if current_officer.nil?
  end
end
