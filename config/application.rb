require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)
Dotenv::Railtie.load

HOSTNAME = ENV["HOSTNAME"]

module DemoApp
  class Application < Rails::Application
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
