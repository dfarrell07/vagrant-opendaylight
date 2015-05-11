[![Join the chat at https://gitter.im/dfarrell07/vagrant-opendaylight](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/dfarrell07/vagrant-opendaylight?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## vagrant-opendaylight

Vagrant environment with support for many different types of OpenDaylight deployments.

**Note: This project is new, incomplete and under active development. Many planned features are still just TODOs on our [issue tracker](https://github.com/dfarrell07/vagrant-opendaylight/issues). Contributions welcome!**

#### Table of Contents
1. [Overview](#overview)
1. [Starting your first box](#starting-your-first-box)
    * [Installing Vagrant](#installing-vagrant)
1. [Contributing](#contributing)

### Overview

This project supports provisioning Vagrant hosts using many different OpenDaylight deployment options (RPM directly, RPM via Puppet, tarball via Puppet...) and against different OSs (CentOS 7, Fedora 20, Fedora 21).

Goals of the project include:

* Serve as working example documentation for deploying OpenDaylight.
* Give developers quick, easy access to different types of OpenDaylight deployments for debugging.
* Provide a simple, reliable way to get some hands-on time with ODL.

### Starting your first box

#### Installing Vagrant

If you don't have Vagrant installed, head over to the [Vagrant Downloads](https://www.vagrantup.com/downloads.html) page and grab the latest version for your OS. Fedora/RHEL/CentOS folks need the RPM package, Ubuntu/Debian folks need the DEB package. Note that Vagrant also supports Windows and OSX.

Assuming you're on Fedora/RHEL/CentOS, find the .rpm file you just downloaded and install it:

```ShellSession
sudo rpm -i <name of rpm>
```

Vagrant uses various "providers" for virtualization support. By default, it uses VirtualBox. If you don't have VirtualBox installed, you'll see an error message when you try to `vagrant up` anything. Install VirtualBox (Fedora/RHEL/CentOS):

```ShellSession
sudo yum install VirtualBox kmod-VirtualBox -y
```

You may need to restart your system, or at least `systemctl restart systemd-modules-load.service`. If you see Kernel-related errors, try that.

#### Installing Required Gems

We use Bundler to make gem management trivial.

```ShellSession
[~/vagrant-opendaylight]$ gem install bundler
# snip
[~/vagrant-opendaylight]$ bundle install
# snip
```

Among other things, this will provide `librarian-puppet`, which is required for the next section.

#### Installing Required Puppet Modules

Once you've installed `librarian-puppet` through Bundler (as described above), you can use it to install our Puppet module dependences.

```ShellSession
[~/vagrant-opendaylight]$ librarian-puppet install
[~/vagrant-opendaylight]$ ls modules
archive  java  opendaylight  stdlib
```

#### Building a box

You should now be able to use Vagrant to build and connect to an ODL box, using the deployment method of your choice.

```ShellSession
[~/vagrant-opendaylight]$ vagrant status
Current machine states:

cent7_pup_rpm             not created (virtualbox)
cent7_pup_tb              not created (virtualbox)
cent7_rpm                 not created (virtualbox)
f20_pup_rpm               not created (virtualbox)
f20_pup_tb                not created (virtualbox)
f20_rpm                   not created (virtualbox)
f21_pup_rpm               not created (virtualbox)
f21_pup_tb                not created (virtualbox)
f21_rpm                   not created (virtualbox)
# snip
[~/vagrant-opendaylight]$ vagrant up cent7_pup_rpm
# snip
[~/vagrant-opendaylight]$ vagrant ssh cent7_pup_rpm
```

### Contributing

We work to make contributing easy. Please let us know if you spot something we can do better.

See our [CONTRIBUTING.markdown](https://github.com/dfarrell07/vagrant-opendaylight/blob/master/CONTRIBUTING.markdown) file for information.
