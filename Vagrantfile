# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Configure VM RAM and CPU. Change this to meet your needs.
  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.memory = 1024
    virtualbox.cpus = 1
  end

  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 1024
    libvirt.cpus = 1
  end

  # NFS is fragile, disable it and use rsync
  config.nfs.functional = false

  #
  # CentOS 7 boxes
  #

  # Box that uses OpenDaylight's Vagrant base box
  config.vm.define "cent7" do |cent7|
    # Simply use OpenDaylight's Vagrant base box
    # NB: Upstream ODL plans to eventually host their own boxes (doesn't atm)
    cent7.vm.box = "dfarrell07/opendaylight"
  end

  # Box that installs ODL Helium directly from an RPM on CentOS 7
  config.vm.define "cent7_rpm_he" do |cent7_rpm_he|
    # Build Vagrant box based on CentOS 7
    cent7_rpm_he.vm.box = "centos/7"

    # Add ODL Yum repo config to correct location in box filesystem
    # We have to do this in two steps, a non-privliated SCP and
    #   a privlaged move.
    #   See: https://github.com/mitchellh/vagrant/issues/4032
    cent7_rpm_he.vm.provision "file", source: "./repo_configs/opendaylight-2-candidate.repo",
                                   destination: "/tmp/opendaylight-2-candidate.repo"
    cent7_rpm_he.vm.provision "shell", inline: "mv /tmp/opendaylight-2-candidate.repo /etc/yum.repos.d/opendaylight-2-candidate.repo"

    # Install ODL using the Yum repo config added above
    cent7_rpm_he.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    cent7_rpm_he.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL Lithium directly from an RPM on CentOS 7
  config.vm.define "cent7_rpm_li" do |cent7_rpm_li|
    # Build Vagrant box based on CentOS 7
    cent7_rpm_li.vm.box = "centos/7"

    # Add ODL Yum repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    cent7_rpm_li.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-3-candidate.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-3-candidate.repo;hb=refs/heads/master\""

    # Install ODL using the Yum repo config added above
    cent7_rpm_li.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    cent7_rpm_li.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs an ODL Beryllium RPM on CentOS 7
  config.vm.define "cent7_rpm_be" do |cent7_rpm_be|
    # Build Vagrant box based on CentOS 7
    cent7_rpm_be.vm.box = "centos/7"

    # Add ODL Yum repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    cent7_rpm_be.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-4-testing.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-4-testing.repo;hb=refs/heads/master\""

    # Install ODL using the Yum repo config added above
    cent7_rpm_be.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    cent7_rpm_be.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL via its Ansible role on CentOS 7
  config.vm.define "cent7_ansible" do |cent7_ansible|
    # Build Vagrant box based on CentOS 7
    cent7_ansible.vm.box = "centos/7"

    # Install ODL using the Ansible provisioner
    cent7_ansible.vm.provision "ansible" do |ansible|
      # Path to Ansible playbook that installs ODL using ODL's Ansible role
      ansible.playbook = "provisioning/playbook.yml"
    end
  end

  # Box that installs ODL via Puppet RPM method on CentOS 7
  config.vm.define "cent7_pup_rpm" do |cent7_pup_rpm|
    # Build Vagrant box based on CentOS 7
    cent7_pup_rpm.vm.box = "centos/7"

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

  # Box that installs ODL via Puppet tarball method on CentOS 7
  config.vm.define "cent7_pup_tb" do |cent7_pup_tb|
    # Build Vagrant box based on CentOS 7
    cent7_pup_tb.vm.box = "centos/7"

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

  #
  # Fedora 22 boxes
  #

  # Box that installs ODL directly from an RPM on Fedora 22
  config.vm.define "f22_rpm_li" do |f22_rpm_li|
    # Build Vagrant box based on Fedora 22
    f22_rpm_li.vm.box = "fedora/22-cloud-base"
    f22_rpm_li.vm.box_url = "https://dl.fedoraproject.org/pub/fedora/linux/releases/22/Cloud/x86_64/Images/Fedora-Cloud-Base-Vagrant-22-20150521.x86_64.vagrant-libvirt.box"

    # Add ODL Yum repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    f22_rpm_li.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-3-candidate.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-3-candidate.repo;hb=refs/heads/master\""

    # Install ODL using the Yum repo config added above
    f22_rpm_li.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    f22_rpm_li.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL via Puppet RPM method on Fedora 22
  # NB: This currently fails because it's ahead of upstream support
  # See: https://github.com/dfarrell07/vagrant-opendaylight/issues/28
  config.vm.define "f22_pup_rpm" do |f22_pup_rpm|
    # Build Vagrant box based on Fedora 22
    f22_pup_rpm.vm.box = "fedora/22-cloud-base"
    f22_pup_rpm.vm.box_url = "https://dl.fedoraproject.org/pub/fedora/linux/releases/22/Cloud/x86_64/Images/Fedora-Cloud-Base-Vagrant-22-20150521.x86_64.vagrant-libvirt.box"

    # Install Puppet
    f22_pup_rpm.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    f22_pup_rpm.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.manifest_file = "odl_install.pp"
    end
  end

  #
  # Fedora 23 boxes
  #

  # Box that installs ODL directly from an RPM on Fedora 23
  config.vm.define "f23_rpm_li" do |f23_rpm_li|
    # Build Vagrant box based on Fedora 23
    f23_rpm_li.vm.box = "fedora/23-cloud-base"

    # Add ODL Yum repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    f23_rpm_li.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-3-candidate.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-3-candidate.repo;hb=refs/heads/master\""

    # Install ODL using the Yum repo config added above
    f23_rpm_li.vm.provision "shell", inline: "dnf install -y opendaylight"

    # Start ODL's service via systemd
    f23_rpm_li.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL directly from an RPM on Fedora 23
  config.vm.define "f23_rpm_be" do |f23_rpm_be|
    # Build Vagrant box based on Fedora 23
    f23_rpm_be.vm.box = "fedora/23-cloud-base"

    # Add ODL Yum repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    f23_rpm_be.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-4-testing.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-4-testing.repo;hb=refs/heads/master\""

    # Install ODL using the Yum repo config added above
    f23_rpm_be.vm.provision "shell", inline: "dnf install -y opendaylight"

    # Start ODL's service via systemd
    f23_rpm_be.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL via Puppet RPM method on Fedora 23
  config.vm.define "f23_pup_rpm" do |f23_pup_rpm|
    # Build Vagrant box based on Fedora 23
    f23_pup_rpm.vm.box = "fedora/23-cloud-base"

    # Install Puppet
    f23_pup_rpm.vm.provision "shell", inline: "dnf install -y puppet"

    # Install OpenDaylight using its Puppet module
    f23_pup_rpm.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.environment_path = "environments"
      puppet.environment = "main"
    end
  end
end
