# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Configure VM RAM and CPU for VirtualBox. Change this to meet your needs.
  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.memory = 1024
    virtualbox.cpus = 1
  end

  # Configure VM RAM and CPU for LibVirt. Change this to meet your needs.
  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 1024
    libvirt.cpus = 1
  end

  # NFS is fragile, disable it and use rsync
  config.nfs.functional = false

  #
  # CentOS 7 boxes
  #

  # Boxes that uses OpenDaylight's Lithium SR4, Beryllium, Beryllium SR1 & SR2 Vagrant base boxes
  centOS7_boxes = {
    "cent7_li_sr4" => "3.4.0",
    "cent7_be" => "4.0.0",
    "cent7_be_sr1" => "4.1.0",
    "cent7_be_sr2" => "4.2.0"
  }
  centOS7_boxes.each do |centOS7_box, version|
    config.vm.define "#{centOS7_box}" do |vbox|
      vbox.vm.box = "opendaylight/odl"
      vbox.vm.box_version = "= #{version}"
    end
  end

  # Box that installs ODL Helium, Lithium, Beryllium, Beryllium SR1 & SR2 directly from an RPM on CentOS 7
  centOS7_boxes = {
      "cent7_rpm_he_sr4" => "24",
      "cent7_rpm_li_sr2" => "32",
      "cent7_rpm_li_sr3" => "33",
      "cent7_rpm_be" => "40",
      "cent7_rpm_be_sr1" => "41",
      "cent7_rpm_be_sr2" => "42",
      "cent7_rpm_ve_latest" => "4"
  }
  centOS7_boxes.each do |centOS7_box, version|
    config.vm.define "#{centOS7_box}" do |vbox|
      # Build Vagrant box based on CentOS 7
      vbox.vm.box = "centos/7"

      # Add ODL RPM repo config to correct location in box filesystem
      # Repo configs are provided by upstream OpenDaylight Integration/Packaging
      vbox.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-#{version}-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-#{version}-release.repo;hb=refs/heads/master\""

      # Install ODL using the RPM repo config added above
      vbox.vm.provision "shell", inline: "yum install -y opendaylight"

      # Start ODL's service via systemd
      vbox.vm.provision "shell", inline: "systemctl start opendaylight"
    end
  end

  # Box that installs ODL, ODL be ERP via its Ansible role and ODL via URL to RPM directly on CentOS 7
  centOS7_boxes = {
    "cent7_ansible" => "all_defaults_playbook.yml",
    "cent7_ansible_latest" => "odl_4_testing_playbook.yml",
    "cent7_ansible_path" => "rpm_path_install_playbook"
  }
  centOS7_boxes.each do |centOS7_box, playbook|
  # This uses the default repo-based RPM install method
    config.vm.define "#{centOS7_box}" do |vbox|
      # Build Vagrant box based on CentOS 7
      vbox.vm.box = "centos/7"

      # Install ODL using the Ansible provisioner
      vbox.vm.provision "ansible" do |ansible|
        # Path to Ansible playbook that installs ODL using ODL's Ansible role
        ansible.playbook = "provisioning/#{playbook}"
      end
    end
  end

  # Box that installs ODL via Puppet RPM and tarball method on CentOS 7
  centOS7_boxes = {
    "cent7_pup_rpm" => "odl_install.pp",
    "cent7_pup_custom_logs" => "custom_loggers.pp",
    "cent7_pup_enable_l3" => "enable_l3.pp",
    "cent7_pup_tb" => "odl_tarball_install.pp"
  }
  centOS7_boxes.each do |centOS7_box, manifest_file|
    config.vm.define "#{centOS7_box}" do |vbox|
      # Build Vagrant box based on CentOS 7
      vbox.vm.box = "centos/7"

      # Add EPEL repo for access to Puppet et al
      vbox.vm.provision "shell", inline: "yum install -y epel-release"

      # Install Puppet
      vbox.vm.provision "shell", inline: "yum install -y puppet"

      # Install OpenDaylight using its Puppet module
      vbox.vm.provision "puppet" do |puppet|
        puppet.module_path = ["modules"]
        puppet.manifest_file = "#{manifest_file}"
      end
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
  # as an auth protocol. ODL offers ssh-dss by default it seems. To SSH
  # to the Karaf shell, tell SSH to accept ssh-dss.
  #   ssh -p 8101 -oHostKeyAlgorithms=+ssh-dss karaf@localhost
  #

  f23_boxes = {
    "f23_rpm_li" => "30",
    "f23_rpm_li_sr1" => "31",
    "f23_rpm_li_sr2" => "32",
    "f23_rpm_li_sr3" => "33",
    "f23_rpm_be" => "40",
    "f23_rpm_be_rel" => "4",
    "f23_rpm_be_latest" => "4"
  }
  # Box that installs ODL directly from an RPM on Fedora 23
  f23_boxes.each do |f23_box, version|
    config.vm.define "#{f23_box}" do |vbox|
      # Build Vagrant box based on Fedora 23
      vbox.vm.box = "fedora/23-cloud-base"

      # Add ODL RPM repo config to correct location in box filesystem
      # Repo configs are provided by upstream OpenDaylight Integration/Packaging
      vbox.vm.provision "shell", inline: "curl --silent -o /etc/yum.repos.d/opendaylight-#{version}-release.repo \"https://git.opendaylight.org/gerrit/gitweb?p=integration/packaging.git;a=blob_plain;f=rpm/example_repo_configs/opendaylight-#{version}-release.repo;hb=refs/heads/master\""

      # Install ODL using the RPM repo config added above
      vbox.vm.provision "shell", inline: "dnf install -y opendaylight"

      # Start ODL's service via systemd
      vbox.vm.provision "shell", inline: "systemctl start opendaylight"
    end
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

  #
  # Debian 8 boxes
  #

  # Box that installs ODL via its Ansible role on Debian 8 using debian repo and .deb URL
  ["repo", "path"].each do |method|
    config.vm.define "debian8_ansible_#{method}" do |debian8_ansible_method|
      # Build Vagrant box based on Debian 8
      debian8_ansible_method.vm.box = "debian/jessie64"

      # Install ODL using the Ansible provisioner
      debian8_ansible_method.vm.provision "ansible" do |ansible|
        # Path to Ansible playbook that installs ODL using ODL's Ansible role
        ansible.playbook = "provisioning/deb_#{method}_install_playbook.yml"
      end
    end
  end

  #
  # Ubuntu boxes
  #

  # Box that installs ODL via its Ansible role on Ubuntu 16.04 using debian repo and .deb URL
  ["repo", "path"].each do |method|
    config.vm.define "ubuntu16_ansible_#{method}" do |ubuntu16_ansible_method|
      # Build Vagrant box based on Ubuntu 16.04
      ubuntu16_ansible_method.vm.box = "ubuntu/xenial64"

      # Install python
      ubuntu16_ansible_method.vm.provision "shell", inline: "apt-get install -y python"

      # Install ODL using the Ansible provisioner
      ubuntu16_ansible_method.vm.provision "ansible" do |ansible|
        # Path to Ansible playbook that installs ODL using ODL's Ansible role
        ansible.playbook = "provisioning/deb_#{method}_install_playbook.yml"
      end
    end
  end

end
