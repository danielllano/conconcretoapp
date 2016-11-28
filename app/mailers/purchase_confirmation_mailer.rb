class PurchaseConfirmationMailer < ApplicationMailer
  default from: %("Montebianco Club House" <dalvarezv@conconcreto.com>)
  default content_type: "text/html"

  def user_confirmation_email(user, purchases)
    @user = user
    @purchases = purchases
    attachments.inline['logo-white-small.png'] = File.read("#{Rails.root}/app/assets/images/logo-white-small.png")
    attachments.inline['project-frame.jpg'] = File.read("#{Rails.root}/app/assets/images/project-frame.jpg")
    mail(to: @user.email, subject: 'Confirmación de redención de puntos')
  end

  def admin_confirmation_email(user, purchases)
    @user = user
    @purchases = purchases
    mail(to: "dalvarezv@conconcreto.com", subject: 'Nueva redención de puntos')
  end

  def purchase_sent_email(purchase)
    @user = purchase.user
    @purchase = purchase
    attachments.inline['big-mailer-icon.png'] = File.read("#{Rails.root}/app/assets/images/big-mailer-icon.png")
    attachments.inline['logo-montebianco.png'] = File.read("#{Rails.root}/app/assets/images/logo-montebianco.png")
    attachments.inline['fondo-01-mailer.jpg'] = File.read("#{Rails.root}/app/assets/images/fondo-01-mailer.jpg")
    mail(to: @user.email, subject: 'Tu redención Montebianco está en camino')
  end
end
