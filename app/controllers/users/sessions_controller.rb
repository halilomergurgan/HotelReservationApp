class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.valid_password?(params[:user][:password])
      token = current_token
      render json: { message: 'Login Successful', user: resource, token: token }, status: :ok
    else
      render json: { message: 'Login Failed', errors: ['Invalid email or password'] }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    head :no_content
  end

  # Token'ı alma metodu
  def current_token
    request.env['warden-jwt_auth.token']
  end
end
