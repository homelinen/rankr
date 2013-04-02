source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

    # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'anjlab-bootstrap-rails', '>= 2.3', :require => 'bootstrap-rails'
gem "haml-rails", "~> 0.4"

gem "nifty-generators", "~> 0.4.6", :group => :development

gem "zeus", :group => :development, :require => false

# Testing Gems
gem 'rspec-rails', '~> 2.0', :group => [:test, :development]
group :test do
  gem 'capybara', '~> 2.0.2'
  gem 'shoulda', '~> 3.3.2'

  gem 'mocha', '~> 0.13.3'

  # Dummy data generation
  gem "faker", "~> 1.1.2"
  gem "factory_girl_rails", "~> 4.0"

  gem 'guard', '~> 1.6.2'
  gem 'guard-rspec', '~> 2.4.0'

  # Notifications for Growl
  # Possibly will cause dep. problems
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'libnotify', '~> 0.8.0', :require => false
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

gem 'devise', '~> 2.2.3'
gem 'cancan', '~> 1.6.9'

gem "paperclip", "~> 3.0"

gem "redcarpet"

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
