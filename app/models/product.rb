class Product < ApplicationRecord
  validates :title,presence: true
  mount_uploader :image, ImageUploader
  mount_uploaders :avatars, AvatarUploader
  serialize :avatars, JSON
end
