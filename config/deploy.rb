set :application, "guardiadiporta"
set :repo_url,  "git@github.com:eppemela/guardiadiporta.git"
set :deploy_to, "/home/pi/guardiadiporta/"
set :scm, :git
set :branch, "master"
set :user, "pi"
set :group, "deployers"
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :remote_cache
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :keep_releases, 5
set :rvm_ruby_version, '2.3.3'
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }


namespace :deploy do
  task :start do ; end
  task :stop do ; end

  # desc "Symlink shared config files"
  # task :symlink_config_files do
  #   run "#{ sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
  # end

  desc 'Restart application'
   task :restart do
     on roles(:app), in: :sequence, wait: 5 do
       execute 'sudo /etc/init.d/nginx restart'
     end
   end
end

after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"
