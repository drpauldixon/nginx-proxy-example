# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|

  # proxy server
  config.vm.define "prx01" do |config|
    config.vm.box = "hajee/centos-5.10-x86_64"
    config.vm.box_url = "https://atlas.hashicorp.com/hajee/boxes/centos-5.10-x86_64"
  
    config.vm.network "private_network", ip: "172.16.12.101"
    
    config.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = false
    
      # Customize the amount of memory on the VM:
      vb.memory = "2048"
    end
    
    config.vm.provision "shell", path: "bin/bootstrap.sh"
    config.vm.provision "shell", path: "bin/nginx.sh"
  end

  # web server
  config.vm.define "web01" do |config|
    config.vm.box = "hajee/centos-5.10-x86_64"
    config.vm.box_url = "https://atlas.hashicorp.com/hajee/boxes/centos-5.10-x86_64"
  
    config.vm.network "private_network", ip: "172.16.12.102"
    
    config.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = false
    
      # Customize the amount of memory on the VM:
      vb.memory = "2048"
    end
    config.vm.provision "shell", path: "bin/bootstrap.sh"
    config.vm.provision "shell", path: "bin/apache.sh"
  end

end
