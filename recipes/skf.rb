#
# Cookbook Name:: owasp-skf
# Recipe:: seccubus
#
# Copyright 2015, Glenn ten Cate
#
# All rights reserved - Do Not Redistribute
#
#

# install dependancies 
%w(gcc.x86_64 python-pip.noarch python-devel.x86_64 libxml2-devel.x86_64 libxslt-devel.x86_64 libffi-devel.x86_64 openssl-devel.x86_64 git httpd mod_wsgi mod_ssl).each do |pkg|
  package pkg
end

# install owasp-skf
bash 'install owasp-skf' do
  not_if { ::File.exists? '/usr/lib/python2.7/site-packages/skf'}
  code <<-EOH
    sudo pip install https://github.com/mitsuhiko/flask/tarball/master
    sudo pip install owasp-skf
    EOH
end

# setup owasp-skf
bash 'setup owasp-skf' do
  not_if { ::File.exists? '/var/www/html/skf-flask'}
  code <<-EOH
    cd /var/www/html; git clone https://github.com/blabla1337/skf-flask.git
    EOH
end

#apply the httpd skf config
template 'skf-httpd.conf' do
  path '/etc/httpd/conf/httpd.conf'
  source 'skf-httpd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

#apply the httpd ssl config
template 'skf-httpd-ssl.conf' do
  path '/etc/httpd/conf.d/ssl.conf'
  source 'skf-httpd-ssl.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

#apply the httpd skf config
template 'skf-wsgi.conf' do
  path '/var/www/html/skf-flask/skf/skf.wsgi'
  source 'skf-wsgi.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

#apply the httpd wsgi conf config
template 'skf-httpd-wsgi.conf' do
  path '/etc/httpd/conf.d/wsgi.conf'
  source 'skf-httpd-wsgi.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

# fix mime for httpd
bash 'fix mime' do
  not_if { ::File.exists? '/etc/httpd/conf/mime.types'}
  code <<-EOH
    cp /etc/mime.types /etc/httpd/conf
    EOH
end

# fix permissions files
bash 'fix permissions owasp-skf' do
  code <<-EOH
    chown -R apache:apache /var/www/html/skf-flask
    EOH
end

# TO-DO need to find fix for SSL config + keys
bash 'fix tls cert owasp-skf' do
  not_if { ::File.exists? '/etc/pki/tls/certs/server.crt'}
  user "root"
  code <<-EOH
    openssl req -subj '/CN=internal.owasp-skf.org/O=OWASP-SKF./C=NL' -new -newkey rsa:4096 -days 365 -nodes -x509 -keyout /etc/pki/tls/private/server.key -out /etc/pki/tls/certs/server.crt
    EOH
end


# start server
bash 'start owasp-skf' do
  #not_if { ::File.exists? '/var/www/html/skf-flask'}
  code <<-EOH
    apachectl restart
    EOH
end


