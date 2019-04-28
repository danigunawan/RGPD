module Api
  module V1
    class SessionsController < ApiController
skip_before_action :verify_authenticity_token


      include SessionsHelper

      def new
      end

      def create
        @officer = Officer.find_by_email(params[:email])
        if @officer && @officer.authenticate(params[:password])
          log_in(@officer)
          remember @officer
          flash[:success] = "Bienvenue!"
          redirect_to officers_path
        else
          flash.now[:danger] = "Courriel ou mot de passe invalide."
          render :new
        end
      end


      def destroy
        log_out if logged_in?
        flash[:success] = "Déconnecté!"
        redirect_to new_session_path
      end
    end
  end
end
