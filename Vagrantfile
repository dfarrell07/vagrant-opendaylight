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

  # Box that uses OpenDaylight's Lithium SR4 Vagrant base box
  config.vm.define "cent7_li_sr4" do |cent7_li_sr4|
    cent7_li_sr4.vm.box = "opendaylight/odl"
    cent7_li_sr4.vm.box_version = "= 3.4.0"
  end

  # Box that uses OpenDaylight's Beryllium Vagrant base box
  config.vm.define "cent7_be" do |cent7_be|
    cent7_be.vm.box = "opendaylight/odl"
    cent7_be.vm.box_version = "= 4.0.0"
  end

  # Box that uses OpenDaylight's Beryllium SR1 Vagrant base box
  config.vm.define "cent7_be_sr1" do |cent7_be_sr1|
    cent7_be_sr1.vm.box = "opendaylight/odl"
    cent7_be_sr1.vm.box_version = "= 4.1.0"
  end

  # Box that uses OpenDaylight's Beryllium SR2 Vagrant base box
  config.vm.define "cent7_be_sr2" do |cent7_be_sr2|
    cent7_be_sr2.vm.box = "opendaylight/odl"
    cent7_be_sr2.vm.box_version = "= 4.2.0"
  end

  # Box that installs ODL Helium directly from an RPM on CentOS 7
  config.vm.define "cent7_rpm_he_sr4" do |cent7_rpm_he_sr4|
    # Build Vagrant box based on CentOS 7
    cent7_rpm_he_sr4.vm.box = "centos/7"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    cent7_rpm_he_sr4.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-24-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-24-release.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    cent7_rpm_he_sr4.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    cent7_rpm_he_sr4.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL Lithium directly from an RPM on CentOS 7
  config.vm.define "cent7_rpm_li_sr2" do |cent7_rpm_li_sr2|
    # Build Vagrant box based on CentOS 7
    cent7_rpm_li_sr2.vm.box = "centos/7"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    cent7_rpm_li_sr2.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-32-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-32-release.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    cent7_rpm_li_sr2.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    cent7_rpm_li_sr2.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL Lithium directly from an RPM on CentOS 7
  config.vm.define "cent7_rpm_li_sr3" do |cent7_rpm_li_sr3|
    # Build Vagrant box based on CentOS 7
    cent7_rpm_li_sr3.vm.box = "centos/7"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    cent7_rpm_li_sr3.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-33-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-33-release.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    cent7_rpm_li_sr3.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    cent7_rpm_li_sr3.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs an ODL Beryllium RPM on CentOS 7
  config.vm.define "cent7_rpm_be" do |cent7_rpm_be|
    # Build Vagrant box based on CentOS 7
    cent7_rpm_be.vm.box = "centos/7"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    cent7_rpm_be.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-40-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-40-release.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    cent7_rpm_be.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    cent7_rpm_be.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs an ODL Beryllium SR1 RPM on CentOS 7
  config.vm.define "cent7_rpm_be_sr1" do |cent7_rpm_be_sr1|
    # Build Vagrant box based on CentOS 7
    cent7_rpm_be_sr1.vm.box = "centos/7"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    cent7_rpm_be_sr1.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-41-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-41-release.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    cent7_rpm_be_sr1.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    cent7_rpm_be_sr1.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs an ODL Beryllium SR2 RPM on CentOS 7
  config.vm.define "cent7_rpm_be_sr2" do |cent7_rpm_be_sr2|
    # Build Vagrant box based on CentOS 7
    cent7_rpm_be_sr2.vm.box = "centos/7"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    cent7_rpm_be_sr2.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-42-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-42-release.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    cent7_rpm_be_sr2.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    cent7_rpm_be_sr2.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs an ODL Beryllium RPM on CentOS 7
  config.vm.define "cent7_rpm_be_latest" do |cent7_rpm_be_latest|
    # Build Vagrant box based on CentOS 7
    cent7_rpm_be_latest.vm.box = "centos/7"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    cent7_rpm_be_latest.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-4-testing.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-4-testing.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    cent7_rpm_be_latest.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    cent7_rpm_be_latest.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL via its Ansible role on CentOS 7
  # This uses the default repo-based RPM install method
  config.vm.define "cent7_ansible" do |cent7_ansible|
    # Build Vagrant box based on CentOS 7
    cent7_ansible.vm.box = "centos/7"

    # Install ODL using the Ansible provisioner
    cent7_ansible.vm.provision "ansible" do |ansible|
      # Path to Ansible playbook that installs ODL using ODL's Ansible role
      ansible.playbook = "provisioning/all_defaults_playbook.yml"
    end
  end

  # Box that installs ODL Be ERP via its Ansible role on CentOS 7
  # This uses the default repo-based RPM install method
  config.vm.define "cent7_ansible_be_latest" do |cent7_ansible_be_latest|
    # Build Vagrant box based on CentOS 7
    cent7_ansible_be_latest.vm.box = "centos/7"

    # Install ODL using the Ansible provisioner
    cent7_ansible_be_latest.vm.provision "ansible" do |ansible|
      # Path to Ansible playbook that installs ODL using ODL's Ansible role
      ansible.playbook = "provisioning/odl_4_testing_playbook.yml"
    end
  end

  # Box that installs ODL via Ansible on CentOS 7 via URL to RPM directly
  config.vm.define "cent7_ansible_path" do |cent7_ansible_path|
    # Build Vagrant box based on CentOS 7
    cent7_ansible_path.vm.box = "centos/7"

    # Install ODL using the Ansible provisioner
    cent7_ansible_path.vm.provision "ansible" do |ansible|
      # Path to Ansible playbook that installs ODL using ODL's Ansible role
      ansible.playbook = "provisioning/rpm_path_install_playbook.yml"
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

  # Box that installs ODL via Puppet RPM method on CentOS 7
  config.vm.define "cent7_pup_custom_logs" do |cent7_pup_custom_logs|
    # Build Vagrant box based on CentOS 7
    cent7_pup_custom_logs.vm.box = "centos/7"

    # Add EPEL repo for access to Puppet et al
    cent7_pup_custom_logs.vm.provision "shell", inline: "yum install -y epel-release"

    # Install Puppet
    cent7_pup_custom_logs.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    cent7_pup_custom_logs.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.manifest_file = "custom_loggers.pp"
    end
  end

  # Box that installs ODL via Puppet RPM method on CentOS 7
  config.vm.define "cent7_pup_enable_l3" do |cent7_pup_enable_l3|
    # Build Vagrant box based on CentOS 7
    cent7_pup_enable_l3.vm.box = "centos/7"

    # Add EPEL repo for access to Puppet et al
    cent7_pup_enable_l3.vm.provision "shell", inline: "yum install -y epel-release"

    # Install Puppet
    cent7_pup_enable_l3.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    cent7_pup_enable_l3.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.manifest_file = "enable_l3.pp"
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

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    f22_rpm_li.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-3-candidate.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-3-candidate.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    f22_rpm_li.vm.provision "shell", inline: "yum install -y opendaylight"

    # Start ODL's service via systemd
    f22_rpm_li.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL via its Ansible role on Fedora 22
  # This uses the default repo-based RPM install method
  # NB: This currently fails because the Ansible role expects yum vs dnf
  # See: https://github.com/dfarrell07/ansible-opendaylight/issues/19
  config.vm.define "f22_ansible" do |f22_ansible|
    # Build Vagrant box based on Fedora 22
    f22_ansible.vm.box = "fedora/22-cloud-base"
    f22_ansible.vm.box_url = "https://dl.fedoraproject.org/pub/fedora/linux/releases/22/Cloud/x86_64/Images/Fedora-Cloud-Base-Vagrant-22-20150521.x86_64.vagrant-libvirt.box"

    # Install ODL using the Ansible provisioner
    f22_ansible.vm.provision "ansible" do |ansible|
      # Path to Ansible playbook that installs ODL using ODL's Ansible role
      ansible.playbook = "provisioning/all_defaults_playbook.yml"
    end
  end

  # Box that installs ODL via Puppet RPM method on Fedora 22
  config.vm.define "f22_pup_rpm" do |f22_pup_rpm|
    # Build Vagrant box based on Fedora 22
    f22_pup_rpm.vm.box = "fedora/22-cloud-base"
    f22_pup_rpm.vm.box_url = "https://dl.fedoraproject.org/pub/fedora/linux/releases/22/Cloud/x86_64/Images/Fedora-Cloud-Base-Vagrant-22-20150521.x86_64.vagrant-libvirt.box"

    # Install Puppet
    f22_pup_rpm.vm.provision "shell", inline: "yum install -y puppet"

    # Install OpenDaylight using its Puppet module
    f22_pup_rpm.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules"]
      puppet.environment_path = "environments"
      puppet.environment = "main"
    end
  end

  #
  # Fedora 23 boxes
  #
  # NB: Recent versions of OpenSSH, shipped with Fedora, don't support ssh-dss
  # as an auth protocol. ODL seems offers ssh-dss by default it seems. To SSH
  # to the Karaf shell, tell SSH to accept ssh-dss.
  #   ssh -p 8101 -oHostKeyAlgorithms=+ssh-dss karaf@localhost
  #

  # Box that installs ODL directly from an RPM on Fedora 23
  config.vm.define "f23_rpm_li" do |f23_rpm_li|
    # Build Vagrant box based on Fedora 23
    f23_rpm_li.vm.box = "fedora/23-cloud-base"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    f23_rpm_li.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-30-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-30-release.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    f23_rpm_li.vm.provision "shell", inline: "dnf install -y opendaylight"

    # Start ODL's service via systemd
    f23_rpm_li.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL directly from an RPM on Fedora 23
  config.vm.define "f23_rpm_li_sr1" do |f23_rpm_li_sr1|
    # Build Vagrant box based on Fedora 23
    f23_rpm_li_sr1.vm.box = "fedora/23-cloud-base"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    f23_rpm_li_sr1.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-31-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-31-release.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    f23_rpm_li_sr1.vm.provision "shell", inline: "dnf install -y opendaylight"

    # Start ODL's service via systemd
    f23_rpm_li_sr1.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL directly from an RPM on Fedora 23
  config.vm.define "f23_rpm_li_sr2" do |f23_rpm_li_sr2|
    # Build Vagrant box based on Fedora 23
    f23_rpm_li_sr2.vm.box = "fedora/23-cloud-base"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    f23_rpm_li_sr2.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-32-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-32-release.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    f23_rpm_li_sr2.vm.provision "shell", inline: "dnf install -y opendaylight"

    # Start ODL's service via systemd
    f23_rpm_li_sr2.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL directly from an RPM on Fedora 23
  config.vm.define "f23_rpm_li_sr3" do |f23_rpm_li_sr3|
    # Build Vagrant box based on Fedora 23
    f23_rpm_li_sr3.vm.box = "fedora/23-cloud-base"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    f23_rpm_li_sr3.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-33-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-33-release.repo;hb=refs/heads/master\""
    # Install ODL using the RPM repo config added above
    f23_rpm_li_sr3.vm.provision "shell", inline: "dnf install -y opendaylight"

    # Start ODL's service via systemd
    f23_rpm_li_sr3.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL directly from an RPM on Fedora 23
  config.vm.define "f23_rpm_be" do |f23_rpm_be|
    # Build Vagrant box based on Fedora 23
    f23_rpm_be.vm.box = "fedora/23-cloud-base"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    f23_rpm_be.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-40-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-40-release.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    # NB: This will currently fail because ODL Be hasn't been released
    f23_rpm_be.vm.provision "shell", inline: "dnf install -y opendaylight"

    # Start ODL's service via systemd
    f23_rpm_be.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL directly from an RPM on Fedora 23
  config.vm.define "f23_rpm_be_rel" do |f23_rpm_be_rel|
    # Build Vagrant box based on Fedora 23
    f23_rpm_be_rel.vm.box = "fedora/23-cloud-base"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    f23_rpm_be_rel.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-4-testing.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-4-release.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    f23_rpm_be_rel.vm.provision "shell", inline: "dnf install -y opendaylight"

    # Start ODL's service via systemd
    f23_rpm_be_rel.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL directly from an RPM on Fedora 23
  config.vm.define "f23_rpm_be_latest" do |f23_rpm_be_latest|
    # Build Vagrant box based on Fedora 23
    f23_rpm_be_latest.vm.box = "fedora/23-cloud-base"

    # Add ODL RPM repo config to correct location in box filesystem
    # Repo configs are provided by upstream OpenDaylight Integration/Packaging
    f23_rpm_be_latest.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-4-testing.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-4-testing.repo;hb=refs/heads/master\""

    # Install ODL using the RPM repo config added above
    f23_rpm_be_latest.vm.provision "shell", inline: "dnf install -y opendaylight"

    # Start ODL's service via systemd
    f23_rpm_be_latest.vm.provision "shell", inline: "systemctl start opendaylight"
  end

  # Box that installs ODL via its Ansible role on Fedora 23
  # This uses the default repo-based RPM install method
  config.vm.define "f23_ansible" do |f23_ansible|
    # Build Vagrant box based on Fedora 23
    f23_ansible.vm.box = "fedora/23-cloud-base"

    # Install Python and py-dnf lib, required by ansible-playbook
    # See: https://github.com/ansible/ansible/issues/14427
    f23_ansible.vm.provision "shell", inline: "dnf install -y python python-dnf"

    # Install ODL using the Ansible provisioner
    f23_ansible.vm.provision "ansible" do |ansible|
      # Path to Ansible playbook that installs ODL using ODL's Ansible role
      ansible.playbook = "provisioning/all_defaults_playbook.yml"
    end
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
