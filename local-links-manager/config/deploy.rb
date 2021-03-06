set :application, "local-links-manager"
set :capfile_dir, File.expand_path('../', File.dirname(__FILE__))
set :server_class, "backend"
set :run_migrations_by_default, true

load 'defaults'
load 'ruby'
load 'deploy/assets'
load 'govuk_admin_template'

set :whenever_command, "bundle exec whenever"
require "whenever/capistrano" # This hooks a task to run before deploy:finalize_update

set :copy_exclude, [
 '.git/*',
 'public/**/*'
]

after "deploy:notify", "deploy:notify:errbit"
