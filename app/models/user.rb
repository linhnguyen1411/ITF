class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :replies
  has_many :series
  has_many :reactions

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true, length: {maximum: Settings.user.max_name,
    minimum: Settings.user.min_name}
end
