module SeriesHelper
  def get_tag_list posts
    tag_list = []
    @posts.each do |post|
      post.tags.each do |tag|
        tag_list << tag
      end
    end
    tag_list.uniq
  end

  def views_count_of_series posts
    posts.map{|post| views_count post.views}.inject(:+) || 0
  end
end
