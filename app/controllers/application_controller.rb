class ApplicationController < ActionController::Base
  helper_method :current_officer
  before_action :login_required, :set_locale

#Looks for a logged in user in the session and loads it.
# If no officer found, returns nil
  def current_officer
    if (officer_id = session[:officer_id])
      @current_officer ||= Officer.find(officer_id)
    elsif (officer_id = cookies.signed[:officer_id])
      officer = Officer.find(officer_id)
    if officer && officer.authenticated?(cookies[:remember_token])
      log_in officer
      @current_officer= officer
    end
  end
  end

#Redirects to login if officer is not logged in.
#This serves as an access security
  def login_required
    redirect_to new_session_path if current_officer.nil?
  end
end

#Sets default language if no language is transmitted in params
def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
end

#Adds the locale for I18n to every link inside the app
def default_url_options
  { locale: I18n.locale }
end
