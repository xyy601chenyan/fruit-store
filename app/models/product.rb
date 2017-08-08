class Product < ApplicationRecord
  validates :title,presence: true
  validates :price, presence: {message:"请填入商品价格"}
  mount_uploader :image, ImageUploader
  mount_uploaders :avatars, AvatarUploader
  serialize :avatars, JSON

  has_many :cart_items
end
