class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  before_action :authenticate_user!
  respond_to :json

  def set_flash_message(key, value)
  end
end
