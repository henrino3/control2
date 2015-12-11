class Banks::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  #  layout false, only: [:new]
  # GET /resource/sign_in
   def new
     if current_admin
       redirect_to admins_path, :notice => "Please Logout as Admin"
     else
         super

     end
    
 
   end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    super
    reset_session
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  def after_sign_in_path_for(resource)
      bank_path(@bank)
  end 
end
