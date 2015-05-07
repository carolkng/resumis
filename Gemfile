source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Utilize the bootstrap frontend framework
gem 'bootstrap-sass'
gem 'bootstrap-sass-extras'
gem 'autoprefixer-rails'
gem 'bootswatch-rails'

# Markdown editor and rendering
gem 'rails-bootstrap-markdown'
gem 'redcarpet', '>= 3.2.3'

# Utilize font-awesome iconogrphy set
gem 'font-awesome-sass', '~> 4.3.0'

# Devise for user authentication
#gem 'devise', '~> 3.4.1'
gem 'devise', github: 'plataformatec/devise'

# Exporting resumes to PDF
gem 'wicked_pdf'

# for encoding emails to prevent harvesting
gem 'actionview-encoded_mail_to'

# because sometimes you need a NULL
gem 'nilify_blanks'

# nice slugged URLs
gem 'friendly_id', '~> 5.1.0'

# Multi-tenancy
gem 'acts_as_tenant'

# Carrierwave for handling uploads to S3
gem 'carrierwave'
gem 'carrierwave-video'
gem 'carrierwave_backgrounder'
gem 'mini_magick'

# queues are cool
gem 'hiredis'
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sinatra', :require => nil # for sidekiq web UI

# pagination
gem 'kaminari'

group :development do
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'spring'
end

group :production do
  # use unicorn to run the app on production
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'fog'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'faker', '~> 1.4.3'

  # for vulnerability scanning
  gem 'brakeman', :require => false
end
