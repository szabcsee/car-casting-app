#      _ _       _ _        _                   _     
#   __| (_) __ _(_) |_ __ _| |_   _  ___   __ _(_)___ 
#  / _` | |/ _` | | __/ _` | | | | |/ _ \ / _` | / __|
# | (_| | | (_| | | || (_| | | |_| | (_) | (_| | \__ \
#  \__,_|_|\__, |_|\__\__,_|_|\__, |\___/ \__, |_|___/
#          |___/              |___/       |___/      
#
# @copyright (C) 2011-2019 DYW Media Kft.
#            36 Furj utca
#            Debrecen-Bank, 4079
#			       Hungary
#            +3620-521-8107
 
require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ApiDharmacloud
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
