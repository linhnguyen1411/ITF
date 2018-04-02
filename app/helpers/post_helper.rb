module PostHelper
  def list_of_post_types
    Post.types.map{|key, value| [key.capitalize, value]}
  end
end
