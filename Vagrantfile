# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Which base image
  config.vm.box = "fedora/35-cloud-base"

  # Open ports to view web pages built within this box
  config.vm.network "forwarded_port", guest: 4000, host: 4000, host_ip: "127.0.0.1"

  # Sync the first path from the host into the second path in the VM
  config.vm.synced_folder "./broadcaststorm.github.io", "/home/vagrant/broadcaststorm.github.io", owner: "vagrant", group: "vagrant"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    # Specify VM memory requirements (MB)
    vb.memory = "2048"

    # Specify VM vCPUs
    vb.cpus = 2

    # Some VMs are borked on "serial console" so hard code this
    vb.customize ["modifyvm", :id, "--uart1", "0x3f8", "4"]
    vb.customize ["modifyvm", :id, "--uartmode1", "tcpserver", "2041"]
    vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
  
  end

  # Provision the VM for a turnkey GitHub site development environment
  config.vm.provision "shell", inline: <<-SHELL
    dnf update -y
    dnf install -y git-core zlib zlib-devel gcc-c++ patch readline \
        readline-devel libyaml-devel libffi-devel openssl-devel make \
        bzip2 autoconf automake libtool bison curl sqlite-devel
        # git @development-tools redhat-rpm-config zlib-devel 
    setenforce 0
    su - vagrant -c "bash --login /vagrant/setup-ruby.sh"
    su - vagrant -c "bundle install --gemfile=/home/vagrant/broadcaststorm.github.io/Gemfile"
    echo "export MYHOST=$(ip address show dev eth0 | awk '/global/ { print \$2; }' | cut -d/ -f1)" >> /home/vagrant/.bashrc
  SHELL
end

### Links to related docs on building this Vagrantfile

## Requirements
# https://jekyllrb.com/docs/installation/

## Pre-requisites for Fedora
# https://jekyllrb.com/docs/installation/other-linux/

## GitHub Pages (build locally)
# https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/testing-your-github-pages-site-locally-with-jekyll
