Rails.application.configure do

  host = Settings.urls.base
  config.API_VERSION = 1

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send.
  ActionMailer::Base.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true


  ActionMailer::Base.smtp_settings = {
		:address => "smtp.gmail.com",
		:port => "587",
		:domain => "gmail.com",
		:user_name => "lazlosite@gmail.com",
		:password => "mi4queridoh",
		:authentication => "plain"
  }

  Rails.application.routes.default_url_options[:host] = host
  config.action_mailer.default_url_options = { host: host }
  config.action_mailer.default_options = { from: 'no-reply@' + host }

  config.action_controller.asset_host = host #Or your domain
  config.action_mailer.asset_host = config.action_controller.asset_host

  # PaperClip
  Paperclip.options[:command_path] = "/usr/bin/"
  attachment_path = 'system/:class/:attachment/:id_partition/:style/:filename'
  config.paperclip_defaults = {
		:path => ":rails_root/public/#{attachment_path}",
		:url => "#{Settings.urls.base}/#{attachment_path}",
  }

  #Helpers
  Rails.application.routes.url_helpers

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false

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

  config.assets.js_compressor = :uglifier

  config.force_ssl = true

  # Route exceptions to the application router vs. default
  config.exceptions_app = self.routes

  # Set to :debug to see everything in the log.
  config.log_level = :error

  # Sentry Config
  Raven.configure do |config|
	 config.dsn = Rails.application.secrets.sentry_dns
  end

end
