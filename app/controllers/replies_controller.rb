class RepliesController < ApplicationController
  def new
    @reply = Reply.new replyable_id: params[:replyable_id], replyable_type: params[:replyable_type], parent_id: params[:parent_id]
    @type = params[:type]
  end

  def create
    @type = params[:type]
    @reply = current_user.replies.build reply_params
    if @reply.save
      flash[:success] = t ".#{@type}.flash_success"
    else
      flash[:danger] = t ".#{@type}.flash_danger"
    end
    respond_to do |format|
      format.js
      format.html{redirect_to @reply.replyable}
    end
  end

  private

  def reply_params
    params.require(:reply).permit :content, :replyable_id, :replyable_type, :parent_id
  end
end
