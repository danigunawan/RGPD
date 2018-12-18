class SessionsController < ApplicationController
  def new
  end

  def create
    officer = Officer.find_by_email(params[:email])
    if officer && officer.authenticate(params[:password])
      session[:officer_id] = officer.id
      redirect_to users_path, notice: "Bienvenue!"
    else
      flash.now[:alert] = "Courriel ou mot de passe invalide."
      render "new"
    end
  end

  def destroy
    session[:officer_id] = nil
    redirect_to new_session_path, notice: "Déconnecté!"
  end
end
