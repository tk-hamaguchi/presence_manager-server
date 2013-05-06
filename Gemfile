source 'https://rubygems.org'

ruby "2.0.0"

gem 'rails', '4.0.0.rc1'


gem 'devise', git:'git://github.com/plataformatec/devise.git', branch:'rails4'
#gem 'omniauth-facebook'
gem 'omniauth-twitter'

group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
end

gem 'jquery-rails'
gem 'twitter-bootstrap-rails'
gem 'therubyracer', platforms: :ruby
gem "less-rails"


group :assets do
  gem 'sass-rails',   '~> 4.0.0.rc1'
  gem 'coffee-rails', '~> 4.0.0.rc1'
  gem 'uglifier', '>= 1.0.3'
end


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jbuilder', '~> 1.0.1'
gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
#gem 'unicorn'
gem 'thin'

group :development do
  gem 'capistrano', group: :development
  gem 'debugger'
  gem 'heroku'
end

#Setting
gem 'settingslogic'

group :test do
  gem 'spring'
  gem 'rb-inotify', '~> 0.9'
  gem 'rspec-rails'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  #gem 'factory_girl_rails'
  gem 'faker'
 
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-cucumber'
end

gem 'factory_girl'

