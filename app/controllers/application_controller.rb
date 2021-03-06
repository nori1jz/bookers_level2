class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  # def before_sign_in_path_for
  #   root_path
  # end
  protected

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  def after_sign_out_path_for(resource)
    root_path
  end
  
  def configure_permitted_parameters
      if resource_class == User
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
        devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
        devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
      end
    end
  end
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end

