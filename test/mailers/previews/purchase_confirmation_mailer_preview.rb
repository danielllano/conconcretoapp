# Preview all emails at http://localhost:3000/rails/mailers/purchase_confirmation_mailer
class PurchaseConfirmationMailerPreview < ActionMailer::Preview
  def purchase_confirmation_email_preview
    PurchaseConfirmationMailer.purchase_sent_email(Purchase.first)
  end
end
