source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8', require: false

# Use postgresql as the database for Active Record
gem 'pg', require: false

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3', require: false

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0', require: false

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0', require: false

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc, require: false

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
# gem 'spring', group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'dotenv-rails'

# Use unicorn as the app server
gem 'unicorn'
gem 'unicorn-rails'

gem 'roar-rails'

gem 'haml-rails'
gem 'haml_coffee_assets', github: 'netzpirat/haml_coffee_assets'

gem 'foundation-rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'fuubar', require: false

  gem 'pry-rails'
end

group :development do
  gem 'rails_layout', require: false

  gem 'better_errors'
  gem 'binding_of_caller', require: false
  gem 'quiet_assets'

  gem 'bullet' # find n+1 queries
end

group :production do
  gem 'rails_12factor'
end
