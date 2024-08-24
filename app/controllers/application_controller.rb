class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json

  def set_flash_message(key, value)
  end
end
