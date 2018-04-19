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
end
