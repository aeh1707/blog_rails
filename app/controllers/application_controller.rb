class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user!, unless: :api_path
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def all_users
    @users = User.all
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :bio, :photo, :email, :password, :password_confirmation)
    end
  end

  def api_path
    request.original_url.include?('api')
  end
end
