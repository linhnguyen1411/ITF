class TagsController < ApplicationController
  def index
    if params[:q]
      tags = Tag.search(name_cont: params[:q]).result.order_by_used_count
      respond_to do |format|
        format.json do
          render json: {data: tags.map(&:name)}
        end
      end
    end
  end
end
