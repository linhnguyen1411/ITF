class RepliesController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]
  before_action :load_reply, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit, :destroy]

  def new
    @reply = Reply.new replyable_id: params[:replyable_id], replyable_type: params[:replyable_type], parent_id: params[:parent_id]
    @type = params[:type]
  end

  def create
    @type = params[:type]
    @reply = current_user.replies.build create_params
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

  def update
    @success = if params[:correct].present?
      if @reply.replyable.user_id == current_user.id && @reply.user_id != current_user.id
        @reply.update_attributes correct_answer: (params[:correct].to_sym == :true)
      end
    else
      @reply.update_attributes(update_params) if check_user
    end
    respond_to do |format|
      format.js
      format.json {render json: @success}
    end
  end

  def destroy
    if @reply.destroy
      flash[:success] = t ".#{@reply.replyable.try(:type)}.flash_success" if params[:reload] == true.to_s
    else
      flash[:danger] = t ".#{@reply.replyable.try(:type)}.flash_danger" if params[:reload] == true.to_s
    end
    respond_to do |format|
      format.json {render json: (post_path(@reply.replyable).to_sym if params[:reload] == true.to_s)}
    end
  end
  private

  def create_params
    params.require(:reply).permit :content, :replyable_id, :replyable_type, :parent_id
  end

  def update_params
    params.require(:reply).permit :content
  end

  def load_reply
    @reply = Reply.find_by id: params[:id]
    return if @reply
    flash[:danger] = t "flash.load.not_found", resource: Reply.name
    redirect_to root_path
  end

  def check_user
    return if current_user.id == @reply.user_id
    respond_to do |format|
      format.html {redirect_to root_path}
      format.json {render json: {type: false, not_login: true}}
      format.js {render}
    end
  end
end
