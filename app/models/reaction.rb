class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :reactionable, polymorphic: true
  after_save :update_point_for_user
  after_destroy :update_point_for_user
  acts_as_paranoid

  enum target_type: [:like, :spam, :upvote, :downvote]

  validates :target_type, presence: true

  scope :include_user, -> {includes :user}
  scope :by_reactionable, -> type, id {where(reactionable_type: type, reactionable_id: id).merge include_user}

  def update_point_for_user
    case
    when (target_type_was.nil? && (upvote? || like?)) || (!target_type_changed? && (downvote? || spam?))
      reactionable.user.update_attributes point: reactionable.user.point + Settings.point.ten
    when (target_type_was.nil? && (downvote? || spam?)) || (!target_type_changed? && upvote? || like?)
      reactionable.user.update_attributes point: reactionable.user.point - Settings.point.ten
    when target_type_changed? && (upvote? || like?)
      reactionable.user.update_attributes point: reactionable.user.point + Settings.point.twenty
    when target_type_changed? && (downvote? || spam?)
      reactionable.user.update_attributes point: reactionable.user.point - Settings.point.twenty
    end
  end
end
