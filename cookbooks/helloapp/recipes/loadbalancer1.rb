
# install haproxy and keepalived package 
%w{ haproxy keepalived }.each do |pkg|
  package pkg do 
  action :install
  end
end


#sysctl configuration to allow non-local addresses binding

template "/etc/sysctl.conf" do
  source "sysctl.conf"
  mode 0644
  owner "root"
  group "root"
end

execute "sysctl change" do
  command "sudo sysctl -p"
end

template "/etc/default/haproxy" do 
  source "haproxy" 
  owner "root"
  group "root"
  mode 0644 
end

template "/etc/keepalived/keepalived.conf" do
  source "keepalived.conf.master"
  mode 0644
  owner "root"
  group "root"
end

template "/etc/haproxy/haproxy.cfg" do
  source "haproxy.cfg"
  mode 0644
  owner "root"
  group "root"
end

#starting service of keepalived 
service "keepalived" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

service "haproxy" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

