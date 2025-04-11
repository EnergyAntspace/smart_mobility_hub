source "https://rubygems.org"

# Use Rails 8.0.2
gem "rails", "~> 8.0.2"

# Modern asset pipeline for Rails (Propshaft)
gem "propshaft"

# PostgreSQL driver for Active Record
gem "pg", "~> 1.1"

# Puma web server
gem "puma", ">= 5.0"

# JavaScript with ESM import maps
gem "importmap-rails"

# Hotwire's Turbo for SPA-like page acceleration
gem "turbo-rails"

# Stimulus for a modest JavaScript framework
gem "stimulus-rails"

# Jbuilder for building JSON APIs
gem "jbuilder"

# Devise for user authentication
gem "devise"

# tzinfo-data is required on Windows (and JRuby) because Windows doesn't include the zoneinfo files
gem "tzinfo-data", platforms: %i[windows jruby]

# Use database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Bootsnap reduces boot times; required in config/boot.rb
gem "bootsnap", require: false

# Kamal enables deploying this application as a Docker container
gem "kamal", require: false

# Thruster adds HTTP asset caching/compression and X-Sendfile acceleration to Puma
gem "thruster", require: false

# Uncomment the following line if image processing support is needed for Active Storage variants
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "rspec-rails", "~> 6.0"
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
