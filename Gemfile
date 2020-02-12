source 'https://rubygems.org'
ruby '2.6.5'

gem 'rails'
gem 'pg'
gem 'unicorn'
gem 'foreman'
gem 'rabl'
gem 'oj'
gem 'has_scope'
gem 'gon'
gem 'js-routes'
gem 'jquery-rails'


group :development do
  gem 'capistrano',      '~> 2.0'
  gem 'net-ssh',         '2.7.0'
  gem 'net-ssh-gateway', '1.2.0'
  gem 'capistrano-unicorn', '0.2.0', :require => false
  gem 'seed_dump'
end


group :development, :test do
  gem 'rspec-rails',        '2.14.1'
  gem 'factory_girl_rails', '4.4.0'
  gem 'faker',              '1.2.0'
end


group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'rake'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'eco'
  gem 'less'
  gem 'less-rails'
  gem 'twitter-bootstrap-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby
  gem 'uglifier'
end
