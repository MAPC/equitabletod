server '54.243.237.9', :app, :web, :db, primary: true
ssh_options[:keys] = ["~/.ssh/MAPC/mapperkey.pem"]

set :user,        'ubuntu'
set :group,       'www-data'

set :branch,      'origin/master'
set :deploy_to,   "/var/www/#{application}"
set :unicorn_env, 'production'