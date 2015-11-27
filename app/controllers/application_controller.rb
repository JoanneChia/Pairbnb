class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :user_signed_in?
  before_action :current_user
  before_action :user_session
  before_filter :configure_permitted_parameters, if: :devise_controller?
  include ApplicationHelper
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| 
      u.permit(:password, :password_confirmation, :current_password) 
    }
  end

  def after_sign_in_path_for(resource)
    listings_path
  end

  def after_sign_out_path_for(resource)
    welcome_path
  end
end


