class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  def after_sign_in_path_for resource
    session[:before_login_url] || root_path
  end

  def authenticate_user
    return if user_signed_in?
    if request.get?
      session[:before_login_url] = request.original_url
    else
      session[:before_login_url] = request.referer
    end
    respond_to do |format|
      format.html {redirect_to new_user_session_path}
      format.json {render json: {type: false, not_login: true}}
      format.js {render :template  => "shared/sign_in.js.erb"}
    end
  end
end
