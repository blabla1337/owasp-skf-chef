#
# Cookbook Name:: owasp-skf
# Recipe:: epel
#
# Copyright 2015, Glenn ten Cate
#
# All rights reserved - Do Not Redistribute
#
#

# for some dependancies we need epel 
remote_file "#{Chef::Config[:file_cache_path]}/epel-release-7-5.noarch.rpm" do
    source "http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm"
    action :create
end

# for some dependancies we need epel
rpm_package "centos_epel" do
    source "#{Chef::Config[:file_cache_path]}/epel-release-7-5.noarch.rpm"
    action :install
end
