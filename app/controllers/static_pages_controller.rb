class StaticPagesController < ApplicationController
  def index
    @posts = Post.question.includes_full.page(params[:page]).per Settings.paginate_default
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
