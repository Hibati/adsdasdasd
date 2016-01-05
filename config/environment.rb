# Load the rails application
require File.expand_path('../application', __FILE__)

Thingspeak::Application.configure do
	config.action_controller.perform_caching = true
	config.cache_store = :file_store, "#{Rails.root}/tmp/cache"

	config.action_mailer.raise_delivery_errors = true
  	config.action_mailer.perform_deliveries = true
	config.action_mailer.default_url_options = { host: '0.0.0.0:8080' }
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.smtp_settings = {
		:enable_starttls_auto => true,
		:address => 'smtp.gmail.com',
		:port => 2525,
		:domain => 'gmail.com',
		:authentication => :login,
		:user_name => 'twer6523@gmail.com',
		:password => '0937655100',
	}
end

# Initialize the rails application
Thingspeak::Application.initialize!
