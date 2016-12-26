source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2', '>= 4.2.7.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', :groups => [:development, :test]
# Use postgres as the database for Active Record in production
group :production do
  gem 'pg', '~> 0.18.4'
end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.0', '>= 3.0.4'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2', '>= 4.2.1'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1', '>= 3.1.4'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5.0', '>= 5.0.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.6', '>= 2.6.1'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.2', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 8.0'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.3', '<= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.3'

  gem 'rspec-rails', '~> 3.2'
  gem 'factory_girl_rails', '~> 4.5'

  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'

  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-rescue'

  # gem "rspec-cells"

  # Model and controller UML class diagram generator
  gem 'railroady'
end

group :test do
  gem "faker", '~> 1.4'
  gem "capybara", '~> 2.4'
  gem "database_cleaner", '~> 1.4'
  gem "launchy", '~> 2.4'
  gem "selenium-webdriver", '>= 2.0'
end

# Use the pure css framework
gem 'purecss-rails', '~> 0.6.0'

# Json support
gem 'json'

# Book metadata extraction library
gem 'bookshark', "~> 1.0.0.pre"

# Devise is a flexible authentication solution for Rails based on Warden.
gem 'devise', '~> 3.4'

# Use puma as app server
gem 'puma', '~> 3.6', '>= 3.6.2'

# Font awesome icon pack
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'

# jQuery plugin for drop-in fix binded events problem caused by Turbolinks
gem 'jquery-turbolinks', '~> 2.1'

# Copy to clipboard
gem 'zeroclipboard-rails', '~> 0.1.2'

# Easy way to store env vars in development
gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'

group :development do
    gem 'capistrano',         require: false
    gem 'capistrano-rvm',     require: false
    gem 'capistrano-rails',   require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma',   require: false
end
