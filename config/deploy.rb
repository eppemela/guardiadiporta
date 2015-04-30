set :application, "guardiadiporta"
set :repo_url,  "git@github.com:eppemela/guardiadiporta.git"
set :deploy_to, "/home/pi/guardiadiporta/public"
set :scm, :git
set :branch, "master"
set :user, "pi"
set :group, "deployers"
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true }
set :keep_releases, 5
set :rvm_ruby_version, '2.1.1'
#default_run_options[:pty] = true

#set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

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
