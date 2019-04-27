class OfficerMailer < ApplicationMailer
  default from: 'contact@yorickjacquin.com'

  def access_right
    @user = params[:user]
    Officer.all.each do |officer|
      mail(to: officer.email, subject: "[FORMULAIRE-RGPD] Nouvelle demande de droit d'accès")
    end
  end

  def edit_right
    @user = params[:user]
    Officer.all.each do |officer|
      mail(to: officer.email, subject: "[FORMULAIRE-RGPD] Nouvelle demande de rectification")
    end
  end

  def limit_right
    @user = params[:user]
    Officer.all.each do |officer|
      mail(to: officer.email, subject: "[FORMULAIRE-RGPD] Nouvelle demande de limitation de traitements")
    end
  end

  def delete_right
    @user = params[:user]
    Officer.all.each do |officer|
      mail(to: officer.email, subject: "[FORMULAIRE-RGPD] Nouvelle demande d'effacement'")
    end
  end
end
