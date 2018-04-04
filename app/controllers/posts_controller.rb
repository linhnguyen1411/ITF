class PostsController < ApplicationController
  before_action :load_post, only: [:show]
  def new
    @post = Post.new
  end

  def show;end

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
    respond_to do |format|
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit :type, :title, :content
  end

  def save_post_tags post, tag
    params[:tags].split(",").each do |item|
      tag = Tag.find_or_create_by! name: item
      PostTag.create post_id: post.id, tag_id: tag.id
    end
  end

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post
    flash[:danger] = t "flash.load.not_found"
    redirect_to root_path
  end
end
