class User < ApplicationRecord
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
  after_initialize :set_default_picture, :if => :new_record?
  has_many :listings

  def set_default_picture
    file = File.join(Rails.root, 'app', 'assets', 'images', 'chicken.jpg')
    self.avatar = File.open(file)
  end
end
