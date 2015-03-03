# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Box that installs ODL via Puppet RPM method on CentOS 7
  config.vm.define "cent7_puppet_rpm" do |cent7_pup_rpm|
    # Build Vagrant box based on CentOS 7
    cent7_pup_rpm.vm.box = "chef/centos-7.0"

    # Add EPEL repo for access to Puppet et al
    cent7_pup_rpm.vm.provision "shell", inline: "yum install -y epel-release"

    # Install Puppet
    cent7_pup_rpm.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    cent7_pup_rpm.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.manifest_file = "odl_rpm_install.pp"
    end
  end

  # Box that installs ODL via Puppet tarball method on CentOS 7
  config.vm.define "cent7_puppet_tarball" do |cent7_pup_tb|
    # Build Vagrant box based on CentOS 7
    cent7_pup_tb.vm.box = "chef/centos-7.0"

    # Add EPEL repo for access to Puppet et al
    cent7_pup_tb.vm.provision "shell", inline: "yum install -y epel-release"

    # Install Puppet
    cent7_pup_tb.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    cent7_pup_tb.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.manifest_file = "odl_tarball_install.pp"
    end
  end

  # Box that installs ODL via Puppet RPM method on Fedora 20
  config.vm.define "fed20_puppet_rpm" do |f20_pup_rpm|
    # Build Vagrant box based on Fedora 20
    f20_pup_rpm.vm.box = "chef/fedora-20"

    # Install Puppet
    f20_pup_rpm.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    f20_pup_rpm.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.manifest_file = "odl_rpm_install.pp"
    end
  end

  # Box that installs ODL via Puppet tarball method on Fedora 20
  config.vm.define "fed20_puppet_tarball" do |f20_pup_tb|
    # Build Vagrant box based on Fedora 20
    f20_pup_tb.vm.box = "chef/fedora-20"

    # Install Puppet
    f20_pup_tb.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    f20_pup_tb.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.manifest_file = "odl_tarball_install.pp"
    end
  end

  # Box that installs ODL via Puppet RPM method on Fedora 21
  config.vm.define "fed21_puppet_rpm" do |f21_pup_rpm|
    # Build Vagrant box based on Fedora 21
    f21_pup_rpm.vm.box = "chef/fedora-21"

    # Install Puppet
    f21_pup_rpm.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    f21_pup_rpm.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.manifest_file = "odl_rpm_install.pp"
    end
  end

  # Box that installs ODL via Puppet tarball method on Fedora 21
  config.vm.define "fed21_puppet_tarball" do |f21_pup_tb|
    # Build Vagrant box based on Fedora 21
    f21_pup_tb.vm.box = "chef/fedora-21"

    # Install Puppet
    f21_pup_tb.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    f21_pup_tb.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.manifest_file = "odl_tarball_install.pp"
    end
  end
end
