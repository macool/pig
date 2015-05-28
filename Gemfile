source "https://yoomee:wLjuGMTu30AvxVyIrq3datc73LVUkvo@gems.yoomee.com"
source 'https://rubygems.org'

# Declare your gem's dependencies in pig.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# gem 'ym_activity', :git => "git@gitlab.yoomee.com:yoomee/ym_activity.git", :branch => "rails-4"
gem 'ym_users',       :git => "git@gitlab.yoomee.com:yoomee/ym_users.git", :branch => "rails-4"
gem 'ym_core',        :git => "git@gitlab.yoomee.com:yoomee/ym_core.git", :branch => "rails-4"
gem 'ym_posts',       :git => "git@gitlab.yoomee.com:yoomee/ym_posts.git", :branch => "rails-4"
gem 'ym_tags',        :git => "git@gitlab.yoomee.com:yoomee/ym_tags.git", :branch => "rails-4"
gem 'ym_videos',      :git => "git@gitlab.yoomee.com:yoomee/ym_videos.git", :branch => "rails-4"
gem 'ym_assets',      :git => "git@gitlab.yoomee.com:yoomee/ym_assets.git"

group :development, :test do
  gem 'guard'
  gem "guard-rspec", require: false
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'pry-byebug'
end