# config valid only for current version of Capistrano
lock '3.4.0'

# 部署的应用名
set :application, 'zzm_hua'
# 源码地址
set :repo_url, 'git@github.com:michael-miao91/zzm_hua.git'
# 源码分支
set :branch, "cap_branch"
# 部署目录
set :deploy_to, "/home/bill/#{fetch(:application)}"
# 链接的文件
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/application.yml')
# 链接的目录
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'pids', 'tmp/sockets')



# set :rbenv_type, :user # or :system, depends on your rbenv setup
# set :rbenv_ruby, '2.3.0'
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}
# set :rbenv_roles, :all # default value

set :rvm_ruby_string, 'ruby-2.3.0'
set :rvm_type, :user

# 可以看到bundle install的输出
set :bundle_flags, ''



# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
