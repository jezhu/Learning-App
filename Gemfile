source 'https://rubygems.org'

gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'bootstrap-sass'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'rails_admin', '~> 1.2'
# Have to use older version with React.js < 16.0 to work with phantomjs
gem 'react-rails', '2.3.1'
# Parses XML
gem 'nokogiri'
# HTTP Client
gem 'faraday'
# Sets environment variables
gem 'figaro'
gem 'responders'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Javascript testing
  gem 'jasmine-rails'
  # RSpec
  gem 'rspec-rails'
  # Replaces fixtures for feeding test data to test suite
  gem 'factory_bot_rails'
  gem 'webmock'
end

group :test do
  gem 'rails-controller-testing'
  # Allows for simulation of user interactions
  gem 'capybara', '~> 2.13'
  gem 'poltergeist'
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
