class StaticPagesController < ApplicationController
  def index
    @posts = Post.includes_full.order_by_votes_count.page(params[:page]).per Settings.paginate_default
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
