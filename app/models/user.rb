class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
    
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true, length: {maximum: Settings.user.max_name,
    minimum: Settings.user.min_name}
end
