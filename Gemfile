source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :development, :test do
  gem 'sqlite3'
  gem "rspec-rails", "~> 2.14.0"
  gem "factory_girl_rails", "~> 4.2.1"
end
group :test do
  gem "faker", "~> 1.1.2"
  gem "capybara", "~> 2.1.0"
  gem "database_cleaner", "~> 1.0.1"
  gem 'shoulda'
end


group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'bcrypt-ruby', :require => 'bcrypt'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end
gem 'bootstrap-sass', '~> 3.1.1'
gem 'jquery-rails'
gem 'will_paginate-bootstrap'
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
