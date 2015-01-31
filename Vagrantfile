# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "cent7" do |cent7|
    # Build Vagrant box based on Fedora 20
    cent7.vm.box = "chef/centos-7.0"

    # Add Puppet repo and install Puppet
    cent7.vm.provision "shell", inline: "rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm"
    cent7.vm.provision "shell", inline: "yum install -y puppet"

    # Install sshpass, used by connect.sh helper script
    # It's not currently in the CentOS 7 repos
    cent7.vm.provision "shell", inline: "rpm -ivh ftp://ftp.muug.mb.ca/mirror/fedora/epel/7/x86_64/s/sshpass-1.05-5.el7.x86_64.rpm"

    # Install OpenDaylight using its Puppet module
    cent7.vm.provision "puppet" do |puppet|
      # These are all default settings, just stating explicitly for clarity
      puppet.module_path = ["modules"]
      puppet.manifest_file = "default.pp"
      puppet.manifests_path = "manifests"
    end
  end

  # TODO: Define Fedora 20 ODL install
end
