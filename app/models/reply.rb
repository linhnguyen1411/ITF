class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :parent_reply, class_name: Reply.name, foreign_key: :parent_id, optional: true
  has_many :children_replies, class_name: Reply.name, foreign_key: :parent_id,
    dependent: :destroy, inverse_of: :parent_reply
  has_many :reactions, as: :reactionable, dependent: :destroy

  validates :content, presence: true

  scope :by_post, -> post_id {where post_id: post_id, parent_id: nil}
  scope :includes_full, -> do
    merge(include_user).merge(include_children_replies).merge include_reactions
  end

  # scope :order_by_reaction_count, -> do
  #   joins("LEFT JOIN reactions ON reactions.deleted_at is NULL and target_type = 0
  #     and reactions.reactionable_id = replies.id and reactions.reactionable_type = 'Reply'")
  #   .group("replies.id").order("count(reactions.id) desc")
  # end

  private

  scope :include_user, -> {includes :user}
  scope :include_children_replies, -> {includes children_replies: [:user, reactions: :user]}
  scope :include_reactions, -> {includes reactions: :user}
end
