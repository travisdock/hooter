class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    authenticated_root_path
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :bio, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :bio, :avatar])
    end
end
