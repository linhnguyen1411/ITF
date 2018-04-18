class SeriesController < ApplicationController
  before_action :load_series, only: [:show]

  def index
    @type = Series.name
    @series = Series.page(params[:page]).per Settings.paginate_default
  end

  def new
    @series = Series.new
  end

  def show
    @votes = @series.reactions.include_user
    @posts = @series.posts
    @replies = Reply.by_replyable(@series).includes_full
  end

  def create
    @series = current_user.series.build series_params
    if @series.save
      flash[:success] = t ".flash_success"
    else
    end
  end

  def series_params
    params.require(:series).permit :title, :content
  end

  def load_series
    @series = Series.find_by id: params[:id]
    return if @series
    flash[:danger] = t "flash.load.not_found", resource: Series.name
    redirect_to root_path
  end
end
