class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchases
  has_many :products, :through => :purchases
  has_many :points_histories
  has_one  :shopping_cart

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/user-default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
