require_relative 'boot'

require "rails"
# Outros rails que você precisa
# require "active_model/railtie"
# require "active_job/railtie"
# require "active_record/railtie"
require "active_storage/engine"
# require "action_controller/railtie"
require "action_mailer/railtie"  # Certifique-se de que esta linha está descomentada
# require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

  module Ohmg
    class Application < Rails::Application
      config.i18n.available_locales = [:fr, :de, :it, :en]  # Incluir :en
      config.i18n.default_locale = :en  # Configurar :en como idioma padrão
    end
  end