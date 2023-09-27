source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'mongoid', '~> 8.0', '>= 8.0.3'
gem 'bson_ext'
gem 'kimurai', '~> 1.4', git: 'https://github.com/n-studio/kimuraframework.git', branch: 'dev/ruby-3'
gem 'kaminari-mongoid', '~> 1.0', '>= 1.0.2'
gem 'rswag'
gem 'whenever'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
end

group :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

