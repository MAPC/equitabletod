source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.17'
gem 'pg', '0.17.1'
gem 'unicorn' # app server
gem 'foreman' # process manager
gem 'rabl', '0.9.3' # JSON templates
gem 'oj',   '2.5.5' # JSON parser
gem 'has_scope',  '0.5.1' # scopes for searching
gem 'gon',        '5.0.4'
gem 'js-routes',  '0.9.7'
gem 'jquery-rails', '3.1.0'


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
  gem 'codeclimate-test-reporter', require: nil
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'eco',          '1.0.0'
  gem 'less',         '2.4.0'
  gem 'less-rails',   '2.4.2'
  gem 'twitter-bootstrap-rails', '2.2.8'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', '0.12.1', platforms: :ruby
  gem 'uglifier', '>= 1.0.3'
end
