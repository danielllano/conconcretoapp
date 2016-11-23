# Preview all emails at http://localhost:3000/rails/mailers/purchase_confirmation_mailer
class PurchaseConfirmationMailerPreview < ActionMailer::Preview
  def purchase_confirmation_email_preview
    PurchaseConfirmationMailer.user_confirmation_email(User.first, [Purchase.first, Purchase.second])
  end
end
