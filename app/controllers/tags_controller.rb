class TagsController < ApplicationController
  before_action :load_tag, only: :show
  def show
    @popular_tags = Tag.order_by.posts_count.include_posts_count.limit Settings.paginate_default
    @posts = @tag.posts.includes_full.page(params[:page]).per Settings.paginate_default
  end

  def index
    if params[:q]
      tags = Tag.search(name_cont: params[:q]).result.order_by.posts_count
      respond_to do |format|
        format.json do
          render json: {data: tags.map(&:name)}
        end
      end
    else
      @tags = Tag.order_by.posts_count.include_posts_count.page(params[:page]).per Settings.paginate_tags
    end
  end

  def load_tag
    @tag = Tag.find_by id: params[:id]
    return if @tag
    redirect_to root_path
    flash[:danger] = t "flash.load.not_found", resource: Tag.name
  end
end
