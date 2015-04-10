# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

NUM_CONSUL_NODES = 3

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'chef/ubuntu-14.04'
  config.vm.network :private_network, type: 'dhcp'

  config.berkshelf.enabled = true

  # Set the version of chef to install using the vagrant-omnibus plugin
  if Vagrant.has_plugin?('vagrant-omnibus')
    config.omnibus.chef_version = 'latest'
  end

  config.vm.define 'consul-primary' do |primary|
    primary.vm.hostname = 'consul-primary'
    primary.vm.network 'private_network', ip: '172.16.0.2' 

    primary.vm.provision :chef_solo do |chef|
      chef.run_list = [
        'recipe[consul_node::primary]'
      ]
    end
  end

  (0...(NUM_CONSUL_NODES - 1)).each do |i|
    config.vm.define "consul-secondary#{i}" do |secondary|
      secondary.vm.hostname = "consul-secondary#{i}"

      secondary.vm.provision :chef_solo do |chef|
        chef.run_list = [
          'recipe[consul_node::secondary]'
        ]
      end
    end
  end
end
