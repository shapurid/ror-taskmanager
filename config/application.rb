# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBlog
  class Application < Rails::Application
    config.load_defaults 6.1
    config.generators do |g|
      g.assets false
    end
    config.i18n.available_locales = %i[en ru]
    config.i18n.default_locale = :ru
    config.i18n.fallbacks = [:en]
    config.action_view.field_error_proc = proc do |html_tag, _instance|
      html_tag
    end
  end
end
