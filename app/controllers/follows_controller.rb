class FollowsController < ApplicationController
  before_action :load_follow, only: [:destroy]

  def create
    follow = current_user.active_follows.find_or_initialize_by follow_params
     result = follow.save ? {type: :follow, id: follow.id} : false
    respond_to do |format|
      format.json { render json: result }
    end
  end

  def destroy
    result = @follow.destroy ? {type: :unfollow} : false
    respond_to do |format|
      format.json { render json: result }
    end
  end

  private

  def follow_params
    params.permit :followable_id, :followable_type
  end

  def load_follow
    @follow = Follow.find params[:id]
    return if @follow.present?
    respond_to do |format|
      format.json { render json: false }
    end
  end
end
