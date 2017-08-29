source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'master' # For 5.x
gem 'passenger'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'simple-navigation-bootstrap'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'themify-icons-rails', github: 'scratch-soft/themify-icons-rails'
# Gems to upload images
gem 'carrierwave', '~> 1.1'
gem 'mini_magick'
# Devise users auth
gem 'devise'
gem 'doorkeeper'
gem 'doorkeeper-i18n'
gem 'pundit'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :development do
  gem 'better_errors'
  gem 'rails_layout'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Gems to create a git hook and verify code style and code smell's
  gem 'overcommit'
  gem 'pry'
  gem 'reek'
  gem 'rubocop', '~> 0.49.1', require: false

  # Gem to create a backup
  gem 'seed_dump'
  # Gem to create  the database schema models pdf
  gem 'rails-erd'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
