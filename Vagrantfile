# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'fileutils'
require 'ipaddr'

VAGRANTFILE_API_VERSION = "2"

MACHINES = File.join(File.dirname(__FILE__), "machines.rb")
if File.exist?(MACHINES)
  require MACHINES
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = $env_config[:general][:box]
  config.vm.box_check_update = $env_config[:general][:box_update]
  count=0
  $env_config[:roles].each do |it|
    config.vm.define it[:name] do |node|
      node.vm.hostname = it[:name]
      ipnum = IPAddr.new( $env_config[:general][:private_ipaddr] ).to_i + count
      node.vm.network :private_network, ip: IPAddr.new(ipnum, Socket::AF_INET).to_s, virtualbox__intnet: $env_config[:general][:intnet]
      count += (1 << 0)
      it[:mount].each do |mnt|
        node.vm.synced_folder mnt[0], mnt[1]
      end
      it[:bind_ports].each do |ports|
        node.vm.network "forwarded_port", guest: ports[0], host: ports[1]
      end
      node.vm.provider "virtualbox" do |vb|
        vb.gui=false
        vb.memory=it[:memory]
      end
      boot = File.join( File.dirname(__FILE__), it[:bootstrap_path] )
      if File.exist?(boot)
        node.vm.provision "shell" do |sh|
          sh.path = it[:bootstrap_path]
          sh.args = it[:name]
        end
      end
    end
  end

end
