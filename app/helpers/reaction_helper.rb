module ReactionHelper
  def reaction_count reactions, target_type
    group_reactions(reactions)[target_type].try(:length) || Settings.zero
  end

  def current_user_reacted? reactions, target_type
    group_reactions(reactions)[target_type].try(:pluck, :user_id).try :include?, current_user.id
  end

  private

  def group_reactions reactions
    reactions.group_by{|reaction| reaction.target_type}
  end
end
