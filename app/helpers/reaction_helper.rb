module ReactionHelper
  def reaction_count reactions, target_type
    group_reactions(reactions)[target_type].try(:length) || Settings.zero
  end

  def current_user_reacted? reactions, target_type
    group_reactions(reactions)[target_type].try(:pluck, :user_id).try :include?, current_user.id
  end

  def label_liked_user_list reactions
    liked_list = group_reactions(reactions)[Settings.reaction.like]
    case
    when liked_list.length == Settings.one
      liked_list.first.user.name
    when current_user_reacted?(reactions, Settings.reaction.like)
      t("reactions.you_and") + pluralize(liked_list.length - Settings.one, t("reactions.other"))
    else
      liked_list.first.user.name + t("reactions.and") + pluralize(liked_list.length - Settings.one, t("reactions.other"))
    end
  end

  def group_reactions reactions
    reactions.group_by{|reaction| reaction.target_type}
  end

  def votes_count reactions
    count = reaction_count(reactions, Settings.reaction.upvote) - reaction_count(reactions, Settings.reaction.downvote)
    count > Settings.zero ? "+" + count.to_s : count
  end

  private

  def get_next_user liked_list
    liked_list.each do |reaction|
      return reaction.user.name unless reaction.user.name == current_user.name
    end
  end
end
