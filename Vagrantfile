# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Box that installed ODL via Puppet mod on CentOS 7
  config.vm.define "cent7_puppet" do |cent7_puppet|
    # Build Vagrant box based on CentOS 7
    cent7_puppet.vm.box = "chef/centos-7.0"

    # Add Puppet repo and install Puppet
    cent7_puppet.vm.provision "shell", inline: "rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm"
    cent7_puppet.vm.provision "shell", inline: "yum install -y puppet"

    # Install sshpass, used by connect.sh helper script
    # It's not currently in the CentOS 7 repos
    cent7_puppet.vm.provision "shell", inline: "rpm -ivh ftp://ftp.muug.mb.ca/mirror/fedora/epel/7/x86_64/s/sshpass-1.05-5.el7.x86_64.rpm"

    # Install OpenDaylight using its Puppet module
    cent7_puppet.vm.provision "puppet" do |puppet|
      # These are all default settings, just stating explicitly for clarity
      puppet.module_path = ["modules"]
      puppet.manifest_file = "default.pp"
      puppet.manifests_path = "manifests"
    end
  end

  # Box that installed ODL via Puppet mod on Fedora 20
  config.vm.define "fed20_puppet" do |fed20_puppet|
    # Build Vagrant box based on Fedora 20
    fed20_puppet.vm.box = "chef/fedora-20"

    # Install Puppet
    fed20_puppet.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    fed20_puppet.vm.provision "puppet" do |puppet|
      # These are all default settings, just stating explicitly for clarity
      puppet.module_path = ["modules"]
      puppet.manifest_file = "default.pp"
      puppet.manifests_path = "manifests"
    end
  end

  # TODO: Define CentOS 7 box that installs directly via RPM
  # TODO: Define Fedora 20 box that installs directly via RPM
end
