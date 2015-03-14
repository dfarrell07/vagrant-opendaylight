[![Join the chat at https://gitter.im/dfarrell07/vagrant-opendaylight](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/dfarrell07/vagrant-opendaylight?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## vagrant-opendaylight

Vagrant environment with support for many different types of OpenDaylight deployments.

**Note: This project is new, incomplete and under active development. Many planned features are still just TODOs on our [issue tracker](https://github.com/dfarrell07/vagrant-opendaylight/issues). Contributions welcome!**

#### Table of Contents
1. [Overview](#overview)
1. [Contributing](#contributing)

### Overview

This project supports provisioning Vagrant hosts using many different OpenDaylight deployment options (RPM directly, RPM via Puppet, tarball via Puppet...) and against different OSs (CentOS 7, Fedora 20).

Goals of the project include:

* Serve as working example documentation for deploying OpenDaylight.
* Give developers quick, easy access to different types of OpenDaylight deployments for debugging.
* Provide a people new to OpenDaylight a simple, reliable way to get some hands-on time with ODL.

### Starting your first box

#### Installing Vagrant

If you don't have Vagrant installed, head over to the [Vagrant Downloads](https://www.vagrantup.com/downloads.html) page and grab the latest version for your OS. Fedora/RHEL/CentOS folks need the RPM package, Ubuntu/Debian folks need the DEB package. Note that Vagrant also supports Windows and OSX.

Assuming you're on Fedora/RHEL/CentOS, find the .rpm file you just downloaded and install it:

```
sudo rpm -i <name of rpm>
```

Vagrant uses various "providers" for virtualization support. By default, it uses VirtualBox. If you don't have VirtualBox installed, you'll see an error message when you try to `vagrant up` anything. Install VirtualBox (Fedora/RHEL/CentOS):

```
sudo yum install VirtualBox kmod-VirtualBox -y
```

You may need to restart your system, or at least `systemctl restart systemd-modules-load.service`. If you see Kernel-related errors, try that.

### Contributing

We work to make contributing easy. Please let us know if you spot something we can do better.

See our [CONTRIBUTING.md](https://github.com/dfarrell07/vagrant-opendaylight/blob/master/CONTRIBUTING.md) file for information.
