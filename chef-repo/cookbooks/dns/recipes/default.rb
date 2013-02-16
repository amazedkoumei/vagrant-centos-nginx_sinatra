#
# Cookbook Name:: dns
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
=begin
case node[:platform]
  when "centos"
    template "/etc/resolv.conf" do
    source "resolv.conf.erb"
    owner "root"
    group "root"
    mode "0644"
  end
else
end
=end
template "/etc/resolv.conf" do
  source "resolv.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end
