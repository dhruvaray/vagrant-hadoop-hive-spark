# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.require_version ">= 1.4.3"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    i = 1
    config.vm.network :forwarded_port, guest: 5800, host: 5800
    config.vm.network :forwarded_port, guest: 50070, host: 50070
    config.vm.network :forwarded_port, guest: 18080, host: 18080
    for p in 4040..4045
        config.vm.network :forwarded_port, guest: p, host: p
    end
    config.vm.box_download_insecure = true
    config.vm.define  "node#{i}" do |node|
        node.vm.box = "ubuntu/xenial64"
	config.vm.define :node1 do |t|
        end
        node.vm.provider "virtualbox" do |v|
          v.name =  "node#{i}"
          v.customize ["modifyvm", :id, "--memory", "8192"]
          v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        end
        node.vm.network :private_network, ip: "10.211.55.101"
        node.vm.hostname = "node1"
        node.vm.provision "shell", path: "scripts/setup-ubuntu.sh"
        node.vm.provision "shell", path: "scripts/setup-java.sh"
 	node.vm.provision "shell", path: "scripts/setup-mysql.sh"
        node.vm.provision "shell", path: "scripts/setup-hadoop.sh"
        node.vm.provision "shell", path: "scripts/setup-hive.sh"
        node.vm.provision "shell", path: "scripts/setup-spark.sh"
        node.vm.provision "shell", path: "scripts/finalize-ubuntu.sh"        

        #node.vm.provision "shell", path: "scripts/setup-tez.sh"
        #node.vm.provision "shell", path: "scripts/setup-pig.sh"
        #node.vm.provision "shell", path: "scripts/setup-flume.sh"
        #node.vm.provision "shell", path: "scripts/setup-sqoop.sh"
        #node.vm.provision "shell", path: "scripts/setup-zeppelin.sh"
    end
end
