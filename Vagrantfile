# -*- mode: ruby -*-
# # vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "rails-box"
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
  config.vm.network "forwarded_port", guest: 80, host: 1235
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end
  config.vm.synced_folder "./share", "/vagrant_data"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./cookbooks", "./site-cookbooks"]
    #chef.add_recipe 'staging_cookbook::commentout_yumconfg_exclude_kernel_recipe'
    chef.add_recipe 'staging_cookbook::deploy_user_recipe'
    chef.add_recipe 'build-essential'
    chef.add_recipe 'git'
    chef.add_recipe 'rbenv'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'xml'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::system'
    chef.add_recipe 'nginx'
    chef.add_recipe 'imagemagick'
    chef.add_recipe 'mysql::client'
    chef.add_recipe 'mysql::server'

    chef.add_recipe 'staging_cookbook::nginx_recipe'
    chef.add_recipe 'staging_cookbook::mysql_recipe'
    #chef.add_recipe 'staging_cookbook::deploy_user_recipe'
    chef.add_recipe 'staging_cookbook::auth_recipe'

    chef.json = {
      "ruby_rbenv" => {
        "global" => "2.2.2",
        "rubies" => "2.2.2",
        "gems" => {
          "2.2.2" => [
            { 'name' => 'bundler' }
          ]
        }
      }
    }
  end
end
