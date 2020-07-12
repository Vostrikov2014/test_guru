class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :attribute])
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end