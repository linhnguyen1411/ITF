class UsersController < ApplicationController
  def index
    @type = :top_users
    @users = User.order_by_point.includes_full.page(params[:page]).per Settings.paginate_user
  end
end
