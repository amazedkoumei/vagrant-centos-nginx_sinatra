#
# Cookbook Name:: nginx_sinatra
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
app_user = node["nginx_sinatra"]["user"]
app_group = node["nginx_sinatra"]["group"]

app_dir = node["nginx_sinatra"]["application_dir"]
log_dir = node["nginx_sinatra"]["log_dir"]
home_dir = "/home/#{app_user}"
rbenv_dir = "#{home_dir}/.rbenv"

[app_dir, log_dir].each do |dir|
  directory "#{dir}" do
    owner app_user
    mode 0755
    action :create
  end
end

%w{ config.ru Gemfile myapp.rb rackup.sh}.each do |filename|
  template "#{app_dir}/#{filename}" do
    source "#{filename}.erb"
    owner app_user
    group app_group
    mode 0755
  end
end

gem_package "bundler" do
  gem_binary "#{rbenv_dir}/shims/gem"
  action :install
end

script "rbenv" do
  interpreter "bash"
  user app_user
  group app_group
  cwd "#{rbenv_dir}/shims"
  code <<-EOH
  sudo -u appuser #{rbenv_dir}/bin/rbenv rehash
  EOH
end

script "Bundling_the_gems" do
  interpreter "bash"
  user app_user
  group app_group
  cwd app_dir
  code <<-EOC
  #{rbenv_dir}/shims/bundle install --path bundle
  EOC
end

bash "rackstop" do
  cwd app_dir
  user app_user
  group app_group
  code "#{app_dir}/rackup.sh stop"
end

bash "rackup" do
  cwd app_dir
  user app_user
  group app_group
  code "#{app_dir}/rackup.sh start"
end

include_recipe "nginx_sinatra::nginx"
