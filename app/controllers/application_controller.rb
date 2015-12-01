class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
 #  before_action :configure_permitted_parameters, if: :devise_controller?

 #  protected

 #  def configure_permitted_parameters
 #  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :bank_type) }
 #  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :bank_type, :password) }
 #  	devise_parameter_sanitizer.for(:sign_up) << :username
 #  	devise_parameter_sanitizer.for(:sign_in) << :username
 # end 
end
