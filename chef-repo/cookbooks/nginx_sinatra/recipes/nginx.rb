#
# Cookbook Name:: nginx_sinatra
# Recipe:: nginx
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'nginx'

template "#{node['nginx']['dir']}/sites-available/sinatra.conf" do
  source "nginx_vhost.conf.erb"
  owner "root"
  group "root"
  mode "644"
end

nginx_site "sinatra.conf"

nginx_site "default" do
  enable false
end

bash "mv_default.conf" do
  user "root"
  cwd "#{node['nginx']['dir']}/conf.d"
  code "mv default.conf default.conf.org"
  
  only_if {File.exists?("#{node['nginx']['dir']}/conf.d/default.conf")}
end

service "nginx" do
  action :reload
end
