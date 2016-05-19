
Vagrant.configure("2") do  |config|
  
  config.vm.define :lb1 do |lb1|
             lb1.vm.box = "ubuntu/trusty64"
             lb1.vm.host_name = "loadbalancer1.example.com"
             lb1.vm.network :private_network, ip: "10.0.5.50", netmask: "255.255.255.0"
             lb1.vm.provider :virtualbox do |vb|
                   vb.customize ["modifyvm", :id, "--memory", "1024"]
                   vb.customize ["modifyvm", :id, "--cpus", "1"]
                   vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
            end
   
            lb1.vm.provision "chef_solo" do |chef|
                 chef.add_recipe "helloapp::loadbalancer1"
                 chef.cookbooks_path = "cookbooks"
                 chef.install = false
           end

     end

    config.vm.define :lb2 do |lb2|
             lb2.vm.box = "ubuntu/trusty64"
             lb2.vm.host_name = "loadbalancer2.example.com"
             lb2.vm.network :private_network, ip: "10.0.5.51", netmask: "255.255.255.0"
             lb2.vm.provider :virtualbox do |vb|
                   vb.customize ["modifyvm", :id, "--memory", "1024"]
                   vb.customize ["modifyvm", :id, "--cpus", "1"]
                   vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
            end
            lb2.vm.provision "chef_solo" do |chef|
                 chef.add_recipe "helloapp::loadbalancer2"
                 chef.cookbooks_path = "cookbooks"
                 chef.install = false
           end

    end
     
    config.vm.define :server1 do |server1|
             server1.vm.box = "ubuntu/trusty64"      
             server1.vm.host_name = "server1.example.com"      
             server1.vm.network :private_network, ip: "10.0.5.20", netmask: "255.255.255.0"
             server1.vm.provider :virtualbox do |vb|
                   vb.customize ["modifyvm", :id, "--memory", "1024"]
                   vb.customize ["modifyvm", :id, "--cpus", "1"]
                   vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
            end
             server1.vm.provision "chef_solo" do |chef|
                 chef.add_recipe "helloapp::appserver"
                 chef.cookbooks_path = "cookbooks"
                 chef.install = false
           end

    end

    config.vm.define :server2 do |server2|
             server2.vm.box = "ubuntu/trusty64"          
             server2.vm.host_name = "server2.example.com"          
             server2.vm.network :private_network, ip: "10.0.5.21", netmask: "255.255.255.0"
             server2.vm.provider :virtualbox do |vb|
                   vb.customize ["modifyvm", :id, "--memory", "1024"]
                   vb.customize ["modifyvm", :id, "--cpus", "1"]
                   vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
            end
            server2.vm.provision "chef_solo" do |chef|
                 chef.add_recipe "helloapp::appserver"
                 chef.cookbooks_path = "cookbooks"
                 chef.install = false
           end
  
  end

 
end
