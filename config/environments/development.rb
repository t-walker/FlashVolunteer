Flashvolunteer::Application.configure do
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
    require 'tlsmail' 
      Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
      ActionMailer::Base.delivery_method = :smtp
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.raise_delivery_errors = true
      ActionMailer::Base.smtp_settings = {
              :address => ENV['MAILER_ADDRESS'] || "smtp.gmail.com",
              :port => "587",
              :domain => "gmail.com",
              :enable_starttls_auto => true,
              :authentication       => "plain",
              :user_name => ENV['MAILER_USERNAME'],
              :password => ENV['MAILER_PASSWORD']
      }

  config.action_mailer.default_url_options = { :host => ENV['SITE_DOMAIN'] || "localhost:3000", :location => nil }

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :file

        
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true

  config.action_controller.perform_caching = false

  config.active_support.deprecation = :log
  # Print deprecation notices to the Rails logger

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin
  
  config.log_level = :debug

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
    # new feature not released yet Bullet.add_footer = true
  end
end
