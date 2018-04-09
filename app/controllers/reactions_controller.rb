class ReactionsController < ApplicationController
  def create
    @reaction = current_user.reactions.find_or_initialize_by reaction_params
    @reaction.target_type = Reaction.target_types[params[:target_type]]
    if @reaction.save

    else
    end
  end

  private

  def reaction_params
    params.permit :reactionable_id, :reactionable_type
  end
end
