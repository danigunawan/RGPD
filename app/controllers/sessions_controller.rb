class SessionsController < ApplicationController
  include SessionsHelper

  skip_before_action :login_required, only: [:new, :create]

  def new
  end

  def create
    @officer = Officer.find_by_email(params[:email])
    if @officer && @officer.authenticate(params[:password])
      log_in(@officer)
      flash[:success] = "Bienvenue!"
      redirect_to users_path
    else
      flash.now[:danger] = "Courriel ou mot de passe invalide."
      render :new
    end
  end


  def destroy
    log_out
    flash[:success] = "Déconnecté!"
    redirect_to new_session_path
  end
end
