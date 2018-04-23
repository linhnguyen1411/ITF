class Series < ApplicationRecord
  has_many :posts, -> { where type: :article }, dependent: :destroy, inverse_of: :series
  belongs_to :user
  has_many :reactions, as: :reactionable, dependent: :destroy
  mount_uploader :cover_image, ImageUploader
  has_many :replies, -> { where parent_id: nil }, as: :replyable, dependent: :destroy
  validates :title, presence: true, length: {maximum: Settings.series.max_title,
    minimum: Settings.series.min_title}
  validates :content, presence: true
  scope :includes_full, -> do
    merge(include_posts).merge(includes_user).merge include_reactions
  end

  scope :order_by_votes_count, -> do
    joins("LEFT JOIN reactions ON reactions.reactionable_id = series.id and reactions.reactionable_type = 'Series'
      and (target_type = #{Reaction.target_types[:upvote]} or target_type = #{Reaction.target_types[:downvote]})
      and reactions.deleted_at is NULL")
    .group("series.id").order "sum(case target_type
      when #{Reaction.target_types[:upvote]} then 1
      when #{Reaction.target_types[:downvote]} then -1
      else 0 end) desc"
  end

  private

  scope :includes_user, -> {includes :user}
  scope :include_posts, -> {includes posts: :views}
  scope :include_reactions, -> {includes :reactions}
end
