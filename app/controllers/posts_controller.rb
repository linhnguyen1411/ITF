class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]
  before_action :load_post, only: [:show]
  before_action :increase_views_count, only: :show

  def new
    @post = Post.new
  end

  def index
    @type = params[:type]
    if Post.types.include? @type
      @posts = Post.send(@type).includes_full.page(params[:page]).per Settings.paginate_post
      @popular_posts = Post.send(@type).order_by_views_count.limit Settings.paginate_little
      @popular_tags = Tag.order_by.posts_count.include_posts_count.limit Settings.paginate_default
      @top_users = User.order_by_point.limit Settings.paginate_little
      respond_to do |format|
        format.js
        format.html
      end
    elsif @type = Series.name.downcase
      @posts = current_user.posts.article.not_belong_to_series(params[:series_id]).includes_full
        .page(params[:page]).per Settings.paginate_default
    else
      respond_to do |format|
        format.js
        format.html {redirect_to root_path}
      end
    end
  end

  def show
    @replies = Reply.by_replyable(@post).includes_full
    @votes = @post.reactions.include_user
  end

  def create
    @post = current_user.posts.build post_params
    Post.transaction do
      @post.save!
      save_post_tags(@post, params[:tags]) if params[:tags].present?
      flash[:success] = t ".flash_success"
      respond_to do |format|
        format.js
      end
    end
  rescue
    @post.errors.add(:tags, t(".tag_error")) if @post.errors.blank?
    respond_to do |format|
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit :type, :title, :content, :cover_image
  end

  def save_post_tags post, tag
    params[:tags].split(",").each do |item|
      @post.post_tags.create! tag: Tag.find_or_create_by!(name: item)
    end
  end

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post
    flash[:danger] = t "flash.load.not_found", resource: Post.name
    redirect_to root_path
  end

  def increase_views_count
    @view = current_user.views.find_or_create_by(post_id: @post.id)
    return if @view.updated_at > Settings.view_timeout.minutes.ago
    @view.update_attributes amount: @view.amount + Settings.one
  end
end
