# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Configure VM RAM and CPU. Change this to meet your needs.
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end

  #
  # CentOS 7 boxes
  #

  # Box that installs ODL via Puppet RPM method on CentOS 7
  config.vm.define "cent7_pup_rpm" do |cent7_pup_rpm|
    # Build Vagrant box based on CentOS 7
    cent7_pup_rpm.vm.box = "chef/centos-7.0"

    # Add EPEL repo for access to Puppet et al
    cent7_pup_rpm.vm.provision "shell", inline: "yum install -y epel-release"

    # Install Puppet
    cent7_pup_rpm.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    cent7_pup_rpm.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.manifest_file = "odl_install.pp"
    end
  end

  # Box that installs ODL via its Ansible role on CentOS 7
  config.vm.define "cent7_ansible" do |cent7_ansible|
    # Build Vagrant box based on CentOS 7
    cent7_ansible.vm.box = "chef/centos-7.0"

    # Install ODL using the Ansible provisioner
    cent7_ansible.vm.provision "ansible" do |ansible|
      # Path to Ansible playbook that installs ODL using ODL's Ansible role
      ansible.playbook = "provisioning/playbook.yml"
    end
  end

  # Box that installs ODL via Puppet tarball method on CentOS 7
  config.vm.define "cent7_pup_tb" do |cent7_pup_tb|
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

  # Box that installs ODL directly from an RPM on CentOS 7
  config.vm.define "cent7_rpm" do |cent7_rpm|
    # Build Vagrant box based on CentOS 7
    cent7_rpm.vm.box = "chef/centos-7.0"

    # Install EPEL repos for access to sshpass (used by scripts/connect.sh)
    cent7_rpm.vm.provision "shell", inline: "yum install -y epel-release"

    # Add ODL Yum repo config to correct location in box filesystem
    # We have to do this in two steps, a non-privliated SCP and
    #   a privlaged move.
    #   See: https://github.com/mitchellh/vagrant/issues/4032
    cent7_rpm.vm.provision "file", source: "./repo_configs/odl_cent7.repo",
                                   destination: "/tmp/odl_cent7.repo"
    cent7_rpm.vm.provision "shell", inline: "mv /tmp/odl_cent7.repo /etc/yum.repos.d/opendaylight.repo"

    # Install ODL using the Yum repo config added above
    cent7_rpm.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    cent7_rpm.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  #
  # Fedora 20 boxes
  #

  # Box that installs ODL via Puppet RPM method on Fedora 20
  config.vm.define "f20_pup_rpm" do |f20_pup_rpm|
    # Build Vagrant box based on Fedora 20
    f20_pup_rpm.vm.box = "chef/fedora-20"

    # Install Puppet
    f20_pup_rpm.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    f20_pup_rpm.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.manifest_file = "odl_install.pp"
    end
  end

  # Box that installs ODL via Puppet tarball method on Fedora 20
  config.vm.define "f20_pup_tb" do |f20_pup_tb|
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

  # Box that installs ODL directly from an RPM on Fedora 20
  config.vm.define "f20_rpm" do |f20_rpm|
    # Build Vagrant box based on Fedora 20
    f20_rpm.vm.box = "chef/fedora-20"

    # Add ODL Yum repo config to correct location in box filesystem
    # We have to do this in two steps, a non-privliated SCP and
    #   a privlaged move.
    #   See: https://github.com/mitchellh/vagrant/issues/4032
    f20_rpm.vm.provision "file", source: "./repo_configs/odl_f20.repo",
                                   destination: "/tmp/odl_f20.repo"
    f20_rpm.vm.provision "shell", inline: "mv /tmp/odl_f20.repo /etc/yum.repos.d/opendaylight.repo"

    # Install ODL using the Yum repo config added above
    f20_rpm.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    f20_rpm.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  #
  # Fedora 21 boxes
  #

  # Box that installs ODL via Puppet RPM method on Fedora 21
  config.vm.define "f21_pup_rpm" do |f21_pup_rpm|
    # Build Vagrant box based on Fedora 21
    f21_pup_rpm.vm.box = "chef/fedora-21"

    # Install Puppet
    f21_pup_rpm.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    f21_pup_rpm.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.manifest_file = "odl_install.pp"
    end
  end

  # Box that installs ODL via Puppet tarball method on Fedora 21
  config.vm.define "f21_pup_tb" do |f21_pup_tb|
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

  # Box that installs ODL directly from an RPM on Fedora 21
  config.vm.define "f21_rpm" do |f21_rpm|
    # Build Vagrant box based on Fedora 21
    f21_rpm.vm.box = "chef/fedora-21"

    # Add ODL Yum repo config to correct location in box filesystem
    # We have to do this in two steps, a non-privliated SCP and
    #   a privlaged move.
    #   See: https://github.com/mitchellh/vagrant/issues/4032
    f21_rpm.vm.provision "file", source: "./repo_configs/odl_f21.repo",
                                   destination: "/tmp/odl_f21.repo"
    f21_rpm.vm.provision "shell", inline: "mv /tmp/odl_f21.repo /etc/yum.repos.d/opendaylight.repo"

    # Install ODL using the Yum repo config added above
    f21_rpm.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    f21_rpm.vm.provision "shell", inline: "systemctl start opendaylight"
  end
end
