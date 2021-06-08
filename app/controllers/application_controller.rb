class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def check_logged_in
    redirect_to calendars_path if user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name identity user_image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name identity user_image])
  end

  # Specify the path after sign in(log in)
  def after_sign_in_path_for(_resource)
    calendars_path
  end
end
