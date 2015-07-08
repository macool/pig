source 'https://rubygems.org'

# Declare your gem's dependencies in pig.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec


group :test do
  gem "sqlite3"
  gem 'therubyracer'
end

group :development, :test do
  gem 'guard'
  gem "guard-rspec", require: false
  gem "guard-cucumber", require: false
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'pry'
  gem 'pry-byebug'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem "poltergeist"
  gem "launchy"
end
