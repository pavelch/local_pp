# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
    config.vm.box = "base"
    config.vm.provision "shell", inline: <<-SHELL
        sudo su -
 	    git clone https://github.com/pavelch/local_pp.git /etc/puppet
 	    ln -snf /etc/puppet/hiera.yaml /etc/hiera.yaml
 	    ln -snf /etc/puppet/hieradata /etc/hieradata
        puppet module install puppetlabs-apache
        puppet module install puppetlabs-aws
        puppet module install puppetlabs-java
        puppet module install maestrodev-maven
        puppet module install puppetlabs-firewall
    SHELL
end
