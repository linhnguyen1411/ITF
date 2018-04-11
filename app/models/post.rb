class Post < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :user
  belongs_to :series, optional: true
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :replies, -> { where parent_id: nil }
  has_many :reactions

  enum type: {article: 0, question: 1}

  validates :title, presence: true, length: {maximum: Settings.post.max_title,
    minimum: Settings.post.min_title}
  validates :content, presence: true

  scope :includes_full, -> do
    merge(include_user).merge(include_tags).merge include_replies_count


  end

  private

  scope :include_user, -> {includes(:user)}
  scope :include_tags, -> {includes(:tags)}
  scope :include_replies_count, -> do
    left_joins(:replies).group("posts.id").select("posts.*, count(replies.id) as replies_count")
  end
end
