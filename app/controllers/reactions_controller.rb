class ReactionsController < ApplicationController
  before_action :authenticate_user, only: [:create]
  def index
    @reactions = Reaction.by_reactionable params[:type], params[:id]
  end

  def create
    reaction = current_user.reactions.find_or_initialize_by reaction_params
    @success = if reaction.target_type == params[:target_type]
      reaction.destroy
    else
      reaction.target_type = Reaction.target_types[params[:target_type]]
      reaction.save
    end
    @reactionable = reaction.reactionable
    @reactions = @reactionable.reactions.include_user
  end

  private

  def reaction_params
    params.permit :reactionable_id, :reactionable_type
  end
end
