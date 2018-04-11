class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :reactionable, polymorphic: true

  enum target_type: [:like, :spam, :upvote, :downvote]

  validates :target_type, presence: true

  scope :include_user, -> {includes :user}
  scope :by_reactionable, -> type, id {where(reactionable_type: type, reactionable_id: id).merge include_user}
end
