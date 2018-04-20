class SeriesController < ApplicationController
  before_action :authenticate_user, only: [:new, :show, :create, :update]
  before_action :load_series, only: [:show, :update]
  def index
    @type = Series.name
    @series = Series.page(params[:page]).per Settings.paginate_series
    @popular_tags = Tag.order_by.posts_count.include_posts_count.limit Settings.paginate_default
    @top_users = User.order_by_point.limit Settings.paginate_little
  end

  def new
    @series = Series.new
  end

  def show
    @votes = @series.reactions.include_user
    @posts = @series.posts.includes_full
    @replies = Reply.by_replyable(@series).includes_full
    @selected_post_id_list = current_user.posts.article.not_belong_to_series(@series.id)
      .select{|post| post.series_id != nil }.pluck(:id)
  end

  def create
    @series = current_user.series.build series_params
    if @series.save
      flash[:success] = t ".flash_success"
    else
    end
  end

  def update
    Post.transaction do
      post_ids = current_user.posts.article.not_belong_to_series(@series.id).select{|post| post.series_id != nil }.pluck(:id).map(&:to_s)
      add_post_ids =  params[:post_ids].split(',') - post_ids
      remove_post_ids = post_ids - params[:post_ids].split(',')
      add_post_ids.each do |post_id|
        post = Post.article.find_by id: post_id
        post.update_attributes! series_id: @series.id
      end
      remove_post_ids.each do |post_id|
        post = Post.article.find_by id: post_id
        post.update_attributes! series_id: nil
      end
    end
    flash[:success] = t ".flash_success.add_posts"
  rescue
    flash[:danger] = t ".flash_danger.add_posts"
  end

  private

  def series_params
    params.require(:series).permit :title, :content
  end

  def load_series
    @series = Series.find_by id: params[:id]
    return if @series
    flash[:danger] = t "flash.load.not_found", resource: Series.name
    redirect_to root_path
  end
end
