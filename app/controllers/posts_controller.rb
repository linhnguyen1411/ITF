class PostsController < ApplicationController
  before_action :load_post, only: [:show, :post]

  def new
    @post = Post.new
  end

  def index
    @type = params[:type]
    if Post.types.include? @type
      @posts = Post.send(@type).includes_full.page(params[:page]).per Settings.paginate_default
    else
      redirect_to root_path
    end
  end

  def show
    @replies = Reply.by_post(@post).includes_full
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
end
