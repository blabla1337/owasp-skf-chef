#
# Cookbook Name:: owasp-skf
# Provider:: default
#
# Copyright 2015, Glenn ten Cate
#
# All rights reserved - Do Not Redistribute
#
#

# Restarts httpd
action :restart do
  log "  Running restart sequence"
  service "httpd" do
    action :restart
    persist false
  end
end