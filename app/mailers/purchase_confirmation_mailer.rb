class PurchaseConfirmationMailer < ApplicationMailer
  default from: %("Sistema de puntos Montebianco" <dalvarezv@conconcreto.com>)

  def user_confirmation_email(user, purchases)
    @user = user
    @purchases = purchases
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
    mail(to: @user.email, subject: 'Tu redención Montebianco está en camino')
  end
end
