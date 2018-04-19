module UserHelper
  def is_following followable
    followable.followers.include? current_user
  end

  def get_follow_id user
    user.passive_follows.each do |follow|
      return follow.id if follow.user_id == current_user.id
    end
  end
end
