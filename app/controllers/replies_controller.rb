class RepliesController < ApplicationController
  before_action :load_post, only: :create

  def new
    @reply = Reply.new post_id: params[:post_id], parent_id: params[:parent_id]
    @post_type = params[:post_type]
  end

  def create
    @reply = current_user.replies.build reply_params
    if @reply.save
      flash[:success] = t ".#{@post.type}.flash_success"
    else
      flash[:danger] = t ".#{@post.type}.flash_danger"
    end
    respond_to do |format|
      format.js
      format.html{redirect_to @post}
    end
  end

  private

  def reply_params
    params.require(:reply).permit :content, :post_id, :parent_id
  end

  def load_post
    @post = Post.find_by id: params[:reply][:post_id]
    return if @post.present?
    flash[:danger] = t "flash.load.not_found", resource: Post.name
    redirect_to root_path
  end
end
