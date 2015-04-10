require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
require 'mina/rvm'    # for rvm support. (http://rvm.io)
require 'mina/unicorn'

require 'dotenv'
Dotenv.load

# Do not use colors, there is some bug with stdin.
set :term_mode, :system

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, ENV["MINA_DOMAIN"]
set :deploy_to, ENV["MINA_DEPLOY_TO"]
set :repository, ENV["MINA_REPOSITORY"]
set :branch, 'master'
set :user, ENV["MINA_USER"]
set :forward_agent, true
set :port, ENV["MINA_PORT"]
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

# For system-wide RVM install.
set :rvm_path, '/home/user/.rvm/scripts/rvm'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['log', '.env']

# Optional settings:
#   set :user, 'foobar'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # Load environment
  queue %{ echo "-----> Loading environment" #{echo_cmd %[source ~/.bashrc]} }
  
  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use[ruby-2.2.1@bookshark-gemset]'

end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/pids"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/pids"] 

  queue! %[mkdir -p "#{deploy_to}/shared/sockets"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/sockets"]   

  queue! %[touch "#{deploy_to}/shared/.env"]
  queue  %[echo "-----> Be sure to edit #{deploy_to}shared/.env"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  to :before_hook do
    # Put things to run locally before ssh
  end

  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      invoke :'unicorn:restart'
    end
  end
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers
#  - http://blog.mccartie.com/2014/08/28/digital-ocean.html

