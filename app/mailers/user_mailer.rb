class UserMailer < ApplicationMailer
  default from: 'yorickjacquin@gmail.com'

  def access_right
    @user = params[:user]
      mail(to: @user.email, subject: "[FORMULAIRE-RGPD] Votre demande de droit d'accès")
  end

  def edit_right
    @user = params[:user]
      mail(to: @user.email, subject: "[FORMULAIRE-RGPD] Votre demande de rectification")
  end

  def limit_right
    @user = params[:user]
      mail(to: @user.email, subject: "[FORMULAIRE-RGPD] Votre demande de limitation de traitements")
  end

  def delete_right
    @user = params[:user]
      mail(to: @user.email, subject: "[FORMULAIRE-RGPD] Votre demande d'effacement")
  end

end
