module PostHelper
  def list_of_post_types
    Post.types.map{|key, value| [key.capitalize, key]}
  end

  def posts_count posts, type
    group_posts(posts)[type].try(:length) || Settings.zero
  end

  def group_posts posts
    posts.group_by{|post| post.type}
  end

  def views_count views
    views.pluck(:amount).inject(:+)
  end
end
