source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.beta1'


gem 'devise', git:'git://github.com/plataformatec/devise.git', branch:'rails4'
gem 'omniauth-facebook'
gem 'omniauth-twitter'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
  gem "twitter-bootstrap-rails"
  gem "less-rails"
  
end

gem 'jquery-rails'

gem 'omniauth-twitter'
gem 'twitter'


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano', group: :development

# To use debugger
gem 'debugger'

group :test do
  gem 'spring'
  gem 'rb-inotify', '~> 0.9'
  gem 'rspec-rails'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
 
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-cucumber'
end
