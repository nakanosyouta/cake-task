# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end
   def after_sign_in_path_for(resource)
     my_page_path
   end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  
  def after_sign_out_path_for(resource)
    root_path
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

protected

def customer_state
  @customer = Customer.find_by(email: params[:customer][:email])
return if !@customer
  if @customer.valid_password?(params[:customer][:password])  && (@customer.is_deleted == true )
    redirect_to root_path
  end
 
end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
end