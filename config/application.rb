require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module HotelReservationApi
  class Application < Rails::Application
    config.load_defaults 7.2

    config.api_only = true

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, key: '_hotel_reservation_api_session'
  end
end
