class ApplicationController < ActionController::Base
  helper_method :current_officer

  def current_officer
    if session[:officer_id]
      @current_officer ||= Officer.find(session[:officer_id])
    else
      @current_officer = nil
    end
  end
end
