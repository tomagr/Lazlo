Rails.application.configure do

  host = 'macain.com.ar'

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send.
  ActionMailer::Base.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true


  ActionMailer::Base.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => "587",
      :domain               => "gmail.com",
      :user_name            => "macainsite@gmail.com",
      :password             => "mi4queridoh",
      :authentication       => "plain"
  }

  Rails.application.routes.default_url_options[:host] = host
  config.action_mailer.default_url_options = { host: host }
  config.action_mailer.default_options = {from: 'no-reply@' + host }



  #Paper Clip
  Paperclip.options[:command_path] = "/usr/bin/"

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like
  # NGINX, varnish or squid.
  # config.action_dispatch.rack_cache = true


  ActionMailer::Base.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => "587",
      :domain               => "gmail.com",
      :user_name            => "macainsite@gmail.com",
      :password             => "mi4queridoh",
      :authentication       => "plain"
  }

  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  host = 'localhost:3000'
  config.action_mailer.default_url_options = { host: host }

  config.action_mailer.default_options = {from: 'no-reply@macain.com.ar'}


  #Paper Clip
  Paperclip.options[:command_path] = "/usr/bin/"

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = false

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  config.i18n.available_locales = :es
end
