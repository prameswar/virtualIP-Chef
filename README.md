# **About project**
This is Chef cookbook that helps to understand high available and scalable architecture. It use Vagrant to provision using chef-solo provisioner and keepalived for virtual IP. keepalived use VRRP (Virtual Router Redundancy Protocol) protocol for failover.   

# **Step to setup environment**
##step 1 : 
install git and clone repository 
```
sudo apt-get install git
git clone https://github.com/prameswar/virtualIP-Chef.git
```
##step 2 :
Install virtualbox and vagrant tool 

##step 3: 
Goto virtualIP-Chef project directory and run command
```
vagrant up
```
##step 4:
If you want to use different IP for load balancer or server then edit Vagrantfile and attributes in cookbooks/helloapp/attributes/default.rb . 

# **Architecture**
```
+---------+   +---------+   +---------+
| loadb1 |---|virtualIP|---| loadb2 |
+---------+   +---------+   +---------+
                   |
     +-------------+-------------+
     |             |             |
+---------+   +---------+   +---------+
|server1  |   | server2 |   | server3 |
+---------+   +---------+   +---------+
```

loadb1 and loadb2 are loadbalancer that will use virtual IP using keepalived so if one loadb1 goes down then aother will serve request on same IP or URL.
we can add as many as app server and load balancer without stoping service.

# Used Tool

```
keepalived 
haproxy 
vagrant 
chef-solo 
```

# **Testing**
After whole architecture up try to down any system/server either loadbalancer or App server and hit virtual IP . It will serve your request. 

Default virtual IP URL is http://10.0.5.100:4567/


