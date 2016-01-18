[![Project Chatroom][1]][2]

## vagrant-opendaylight

*An OpenDaylight deployment sandbox.*

Vagrant environment with support for many different types of OpenDaylight
deployments.

#### Table of Contents

1. [Overview](#overview)
    * [Available Boxes](#available-boxes)
1. [General Dependencies: Vagrant](#general-dependencies-vagrant)
1. [Ansible Deployments](#ansible-deployments)
    * [Ansible Dependencies: Roles](#ansible-dependencies-roles)
    * [Ansible Dependencies: `ansible-galaxy`](#ansible-dependencies-ansible-galaxy)
1. [Puppet Deployments](#puppet-deployments)
    * [Puppet Dependencies: Gems](#puppet-dependencies-gems)
    * [Puppet Dependencies: Modules](#puppet-dependencies-modules)
1. [Standalone RPM Deployments](#standalone-rpm-deployments)
1. [Contributing](#contributing)

### Overview

This project supports provisioning Vagrant hosts using many combinations
of host OSs (CentOS 7, Fedora 21) and OpenDaylight deployment
options (RPM directly, Puppet mod, Ansible role, etc).

Goals of the project include:

* Serve as working example documentation for deploying OpenDaylight.
* Give developers quick, easy access to different types of OpenDaylight
deployments for debugging.
* Provide a simple, reliable way to get some hands-on time with ODL.

#### Available Boxes

```ShellSession
[~/vagrant-opendaylight]$ vagrant status
Current machine states:

cent7                     not created (libvirt)
cent7_rpm_he_sr4          not created (libvirt)
cent7_rpm_li_sr2          not created (libvirt)
cent7_rpm_be              not created (libvirt)
cent7_ansible             not created (libvirt)
cent7_pup_rpm             not created (libvirt)
cent7_pup_tb              not created (libvirt)
f22_rpm_li                not created (libvirt)
f22_pup_rpm               not created (libvirt)
f23_rpm_li                not created (libvirt)
f23_rpm_li_sr1            not created (libvirt)
f23_rpm_li_sr2            not created (libvirt)
f23_rpm_li_sr3            not created (libvirt)
f23_rpm_be                not created (libvirt)
f23_ansible               not created (libvirt)
f23_pup_rpm               not created (libvirt)
```

### General Dependencies: Vagrant

If you don't have Vagrant installed, head over to the [Vagrant Downloads][3]
page and grab the latest version for your OS. Fedora/RHEL/CentOS folks need
the RPM package, Ubuntu/Debian folks need the DEB package. Note that Vagrant
also supports Windows and OSX.

Assuming you're on Fedora/RHEL/CentOS, find the .rpm file you just downloaded
and install it:

```ShellSession
sudo rpm -i <name of rpm>
```

Vagrant uses various "providers" for virtualization support. By default, it
uses VirtualBox. If you don't have VirtualBox installed, you'll see an error
message when you try to `vagrant up` anything. Install VirtualBox
(Fedora/RHEL/CentOS):

```ShellSession
sudo yum install -y VirtualBox kmod-VirtualBox
```

You may need to restart your system, or at least `systemctl restart
systemd-modules-load.service`. If you see Kernel-related errors, try that.

### Ansible Deployments

Deploying OpenDaylight using its [Ansible role][6].

#### Ansible Dependencies: `ansible-galaxy`

The recommended way to install OpenDaylight's Ansible role, for use by
Vagrant's Ansible provisioner, is via the `ansible-galaxy` tool. It
ships with Ansible, so you may already have it installed.

```ShellSession
sudo yum install -y ansible
```

#### Ansible Dependencies: Roles

After you install the `ansible-galaxy` tool, point it at the project's
`requirements.yml` file to install ODL's role.

```ShellSession
[~/vagrant-opendaylight]$ ansible-galaxy install -r requirements.yml
```

To update the Ansible role to the latest from the project's `master` branch,
add a `--force` flag.

```ShellSession
[~/vagrant-opendaylight]$ ansible-galaxy install -r requirements.yml --force
```

### Puppet Deployments

Deploying OpenDaylight using its [Puppet module][7].

#### Puppet Dependencies: Gems

Deploying OpenDaylight using Puppet as a Vagrant provisioner requires
the `puppet` and `librarian-puppet` gems. We use Bundler to make gem
management trivial.

```ShellSession
[~/vagrant-opendaylight]$ sudo dnf install -y rubygems
[~/vagrant-opendaylight]$ gem install bundler
[~/vagrant-opendaylight]$ bundle install
```

#### Puppet Dependencies: Modules

In order to use the ODL Puppet mod as a Vagrant provisioner, you'll of course
need to install it. The `librarian-puppet` gem (install docs above) can make
use of our `Puppetfile` and the dependency declarations of the ODL Puppet mod
to trivially install everything we need.

```ShellSession
[~/vagrant-opendaylight]$ librarian-puppet install
[~/vagrant-opendaylight]$ ls modules
archive  java  opendaylight  stdlib
```

`librarian-puppet` can also handle Puppet module updates.

```ShellSession
[~/vagrant-opendaylight]$ librarian-puppet update
```

### Standalone RPM Deployments

Deploying OpenDaylight using [its RPM][8] directly, without additional configuration
from a config management tool.

Standalone RPM deployments don't require any dependencies.

### Contributing

We work to make contributing easy. Please let us know if you spot something
we can do better.

See our [CONTRIBUTING.markdown][4] file for information.


[1]: https://badges.gitter.im/Join%20Chat.svg
[2]: https://gitter.im/dfarrell07/vagrant-opendaylight?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge
[3]: https://www.vagrantup.com/downloads.html
[4]: https://github.com/dfarrell07/vagrant-opendaylight/blob/master/CONTRIBUTING.markdown
[5]: https://github.com/dfarrell07/vagrant-opendaylight/issues/26
[6]: https://github.com/dfarrell07/ansible-opendaylight
[7]: https://github.com/dfarrell07/puppet-opendaylight
[8]: https://github.com/opendaylight/integration/tree/master/packaging/rpm
