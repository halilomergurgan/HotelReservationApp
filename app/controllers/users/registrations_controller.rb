class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def respond_with(resource, _opts = {})
    #Rails.logger.debug "Received POST data: #{params.inspect}"
    if resource.persisted?
      render json: { message: 'Success', user: resource }, status: :ok
    else
      render json: { message: 'Error', errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name ])
  end
end
