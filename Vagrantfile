# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.define "centos" do |web|
    web.vm.box = "centos/7"
  end

  config.vm.define "ubuntu" do |db|
    db.vm.box = "ubuntu/xenial64"
  end
  
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.memory = "1024"
  end

  config.vm.network "public_network"

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/srv/formulas/mattermost-formula", type: "rsync",
    rsync__exclude: ".git/",
    rsync__args: ["--verbose", "--rsync-path='sudo rsync'", "--archive", "--delete", "-z"]


  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "vagrant/minion"
    salt.bootstrap_script = "vagrant/bootstrap_salt.sh"
  end

end