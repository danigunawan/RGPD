class UserMailer < ApplicationMailer
  default from: 'rgpd@madparis.fr'

  def access_right
    @user = params[:user]
      mail(to: @user.email, subject: "[FORMULAIRE-RGPD] Nouvelle demande de droit d'accès")
  end

  def edit_right
    @user = params[:user]
      mail(to: @user.email, subject: "[FORMULAIRE-RGPD] Nouvelle demande de rectification")
  end

  def limit_right
    @user = params[:user]
      mail(to: @user.email, subject: "[FORMULAIRE-RGPD] Nouvelle demande de limitation de traitements")
  end

  def delete_right
    @user = params[:user]
      mail(to: @user.email, subject: "[FORMULAIRE-RGPD] Nouvelle demande d'effacement'")
  end

end
