module ReplyHelper
  def view_more_replies? replies_count
    replies_count > Settings.reply.limit_for_children_replies
  end

  def link_to_view_more_replies replies_count
    I18n.t("posts.reply.view_more") +
      (replies_count - Settings.reply.limit_for_children_replies).to_s +
      I18n.t("posts.reply.replies")
  end

  def hide_replies? reply_counter
    reply_counter >= Settings.reply.limit_for_children_replies
  end
end
