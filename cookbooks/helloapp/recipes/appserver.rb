
directory '/opt/app' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/opt/app/app.rb' do
  source 'app.rb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/opt/app/config.ru' do
  source 'config.ru'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/opt/app/Gemfile' do
  source 'Gemfile'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

gem_package 'sinatra' do
  action :install
end

#gem_package 'puma' do
#  action :install
# version '3.4.0'
#end

template "/etc/init.d/helloapp" do
  source "helloapp"
  mode 0755
  owner "root"
  group "root"
end

execute " default upstart " do 
command "sudo update-rc.d helloapp defaults"
end

execute "starting helloapp " do 
command " sudo service helloapp start > /dev/null 2>&1"
end
 
