class Post < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :user
  belongs_to :series, optional: true
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :replies, -> { where parent_id: nil }, as: :replyable, dependent: :destroy
  has_many :reactions, as: :reactionable, dependent: :destroy
  has_many :views, dependent: :destroy

  mount_uploader :cover_image, ImageUploader

  enum type: {article: 0, question: 1}

  validates :title, presence: true, length: {maximum: Settings.post.max_title,
    minimum: Settings.post.min_title}
  validates :content, presence: true

  scope :includes_full, -> do
    merge(include_user).merge(include_tags).merge(include_replies).merge(include_reactions).include_views
  end
  scope :order_by_votes_count, -> do
    joins("LEFT JOIN reactions ON reactions.reactionable_id = posts.id and reactions.reactionable_type = 'Post'
      and (target_type = #{Reaction.target_types[:upvote]} or target_type = #{Reaction.target_types[:downvote]})
      and reactions.deleted_at is NULL")
    .group("posts.id").order "sum(case target_type
      when #{Reaction.target_types[:upvote]} then 1
      when #{Reaction.target_types[:downvote]} then -1
      else 0 end) desc"
  end

  scope :order_by_views_count, -> do
    left_joins(:views).group("posts.id").order("sum(amount) desc, created_at desc").select("posts.*, sum(amount) as views_count")
    .merge(include_user)
  end

  private

  scope :include_user, -> {includes(:user)}
  scope :include_tags, -> {includes(:tags)}
  scope :include_reactions, -> {includes(:reactions)}
  scope :include_replies, -> {includes(:replies)}
  scope :include_views, -> {includes(:views)}
  # scope :include_replies, -> do
  #   left_joins(:replies).group("posts.id").select("posts.*, count(replies.id) as replies_count")
  # end
end
