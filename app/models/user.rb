class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :series, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :active_follows, class_name: Follow.name, inverse_of: :user, dependent: :destroy
  has_many :following_users, through: :active_follows, source: :followable, source_type: User.name
  has_many :passive_follows, class_name: Follow.name, as: :followable, dependent: :destroy
  has_many :followers, through: :passive_follows, source: :user
  has_many :following_tags, through: :active_follows, source: :followable, source_type: Tag.name
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, ImageUploader

  validates :name, presence: true, length: {maximum: Settings.user.max_name,
    minimum: Settings.user.min_name}

  scope :order_by_point, -> {order point: :desc}
  scope :includes_full, -> do
    merge(include_replies_count).merge(include_posts_count).merge(include_followers)
  end

  private

  scope :include_replies_count, -> do
    left_joins(:replies).group("users.id").select("users.*, count(distinct replies.id) as replies_count")
  end
  scope :include_posts_count, -> do
    left_joins(:posts).group("users.id").select("users.*, count(distinct posts.id) as posts_count")
  end

  scope :include_followers, -> {includes :followers}
end
