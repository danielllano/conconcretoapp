class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  after_update :send_notification_after_change

  def send_notification_after_change
    if (self.status_changed? && self.status == "Enviado")
      PurchaseConfirmationMailer.purchase_sent_email(self).deliver_later
    end
  end
end
