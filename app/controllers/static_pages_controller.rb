class StaticPagesController < ApplicationController
  def index
    @questions = Post.question.includes_full.order_by_votes_count.page(params[:page]).per Settings.paginate_index
    @articles = Post.article.includes_full.order_by_votes_count.page(params[:page]).per Settings.paginate_index
    @top_users = User.order_by_point.limit Settings.paginate_little
    @popular_tags = Tag.order_by.posts_count.include_posts_count.limit Settings.paginate_default

  end
  def question_detail
  end
  def question_list
  end
  def profile
  end
  def login
  end
  def register
  end
end
