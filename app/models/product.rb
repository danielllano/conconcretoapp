class Product < ActiveRecord::Base
  has_many :purchases
  has_many :users, :through => :purchases

  has_attached_file :image1, styles: { medium: "x450", small: "x150" }
  validates_attachment_content_type :image1, content_type: /\Aimage\/.*\z/

  has_attached_file :image2, styles: { medium: "x450", small: "x150" }
  validates_attachment_content_type :image1, content_type: /\Aimage\/.*\z/

  has_attached_file :image3, styles: { medium: "x450", small: "x150" }
  validates_attachment_content_type :image1, content_type: /\Aimage\/.*\z/
end
