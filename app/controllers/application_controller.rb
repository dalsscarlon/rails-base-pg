class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Restriction to authentication.
  # before_action :authenticate_user!

  # Params permited to users
  before_action :configure_permitted_parameters, if: :devise_controller?

  ##--- Notes boxes
  add_flash_types :success, :warning, :notice, :info

  protected

  def configure_permitted_parameters
    added_attrs = %i[username first_name last_name email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
