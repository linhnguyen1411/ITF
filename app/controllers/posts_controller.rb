class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]
  before_action :load_post, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :increase_views_count, only: :show

  def new
    @post = Post.new
  end

  def edit
    @tags = @post.tags
  end

  def index
    @type = params[:type]
    if Post.types.include? @type
      @posts = Post.send(@type).includes_full.page(params[:page]).per Settings.paginate_post
      @popular_posts = Post.send(@type).include_user.order_by_views_count.limit Settings.paginate_little
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
    @replies = Reply.by_replyable(@post).order_by_reaction_count.includes_full
    @votes = @post.reactions.include_user
  end

  def create
    @post = current_user.posts.build create_params
    Post.transaction do
      @post.save!
      save_post_tags(@post, params[:tags]) if params[:tags].present?
      flash[:success] = t ".#{@post.type}.flash_success"
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

  def update
    Post.transaction do
      @post.update_attributes update_params
      @post.tags.destroy_all unless @post.tags.pluck(:name).join(",") == params[:tags]
      save_post_tags(@post, params[:tags]) unless @post.tags.pluck(:name).join(",") == params[:tags]
      flash[:success] = t ".#{@post.type}.flash_success"
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

  def destroy
    if @post.destroy
      flash[:success] = t ".#{@post.type}.flash_success"
    else
      flash[:danger] = t ".#{@post.type}.flash_danger"
    end
    respond_to do |format|
      format.json {render json: root_path.to_sym}
    end
  end

  private

  def create_params
    params.require(:post).permit :type, :title, :content, :cover_image
  end

  def update_params
    params.require(:post).permit :title, :content, :cover_image
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

  def check_user
    return if current_user.id == @post.user_id
    respond_to do |format|
      format.html {redirect_to root_path}
      format.json {render json: false}
      format.js {render}
    end
  end
end
