class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user_id = current_user.id
    Post.transaction do
	  @post.save!
	  save_post_tags(@post, params[:tags]) if params[:tags].present?
	  flash[:success] = t "flash.create.create_success"
      respond_to do |format|
	    format.js
	  end
	end
  rescue
    flash[:danger] = t "flash.create.create_failure"
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
end
