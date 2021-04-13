class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!,except: [:top]
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end


  protected

  def configure_pergit pumitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image])
  end

end
