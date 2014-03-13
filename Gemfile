source 'https://rubygems.org'

gem 'rails', '~> 3.2.16'
gem 'pg'
gem 'bcrypt-ruby', '~> 3.0.0'

gem 'simple_form'
gem 'jquery-rails'
gem "paperclip", "~> 3.0"
gem 'figaro'
gem "cocoon"
gem "aws-sdk"
gem 'hashie'

group :development do
  gem "pry-rails"
  gem "better_errors"
  gem "binding_of_caller"
  gem 'meta_request'
  gem 'xray-rails'
  gem "rack-livereload"
  gem 'guard'
  gem 'guard-minitest'
  gem 'guard-livereload'
  gem "guard-pow", require: false
  gem 'ruby_gntp'
  gem "letter_opener"
end

group :development, :test do
  gem "minitest-rails", github: "blowmage/minitest-rails"
  gem 'factory_girl_rails'
  gem "ffaker"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass', '~> 3.1.0'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'asset_sync'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end
