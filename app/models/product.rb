class Product < ActiveRecord::Base
  has_many :purchases
  has_many :users, :through => :purchases

  has_attached_file :image1, styles: { medium: "x600", small: "x200" }
  validates_attachment_content_type :image1, content_type: /\Aimage\/.*\z/

  has_attached_file :image2, styles: { medium: "x600", small: "x200" }
  validates_attachment_content_type :image2, content_type: /\Aimage\/.*\z/

  has_attached_file :image3, styles: { medium: "x600", small: "x200" }
  validates_attachment_content_type :image3, content_type: /\Aimage\/.*\z/

  scope :available, -> { where("available_qty > 0") }
  scope :not_available, -> { where("available_qty < 1") }

end
