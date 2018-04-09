class Post < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :user
  belongs_to :series, -> {joins :posts}, optional: true
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :replies
  has_many :reactions

  enum type: {article: 0, question: 1}

  validates :title, presence: true, length: {maximum: Settings.post.max_title,
    minimum: Settings.post.min_title}
  validates :content, presence: true

  scope :includes_full, -> {merge(include_user).merge include_tags}
  private

  scope :include_user, -> {includes(:user)}
  scope :include_tags, -> {includes(:tags)}
end
