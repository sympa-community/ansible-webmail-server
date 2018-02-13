# Webmail server for Sympa development

This Ansible playbook deploys a horde groupware edition webamil on a VM. The purpose of such a webmail is to be able to send to and receive mail from a Sympa development server.
While developing features and fixing bugs it is often handy to be able to send mails to check that a process is correctly handled by Sympa. This is easier on a development environement and especially if you don't have to hanlde mail routing from your development machine to your Sympa development servers.
This Ansible playbooks creates a local virtual machine on your computer, that you can easily setup to send and receive mail only to a Sympa server. The same tweaking is possible on the community-supported Sympa Ansbile playbook.

# [Quickstart: Creating a development VM](id:quickstart)

This section is intended to get you started quickly with a development VM. It lets you install the required tools 
and lets you create a Vagrant VM and run an Ansible playbook on it. It does not use the encryption feature of 
Ansible tools. The how and why are described in the sections below.

First install the tools on your local machine:

* Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org). Virtualbox will run 
  the development VM and Vagrant is used to create, configure and manage the development VM instance.
* Install [Ansible](http://www.ansible.com). There are several ways to install Ansible. They are described in the 
  [Ansible installation guide](http://docs.ansible.com/ansible/intro_installation.html).

Clone or download this repository to your local machine if you haven't already. Next change into the "ansible-tools" 
directory (i.e. where this README is located) and create and start the development VM: 

    $ vagrant up

This prepares a VM that is ready to be managed by Ansible. It will call a simple Ansible playbook to make some changes to the VM. 
Run the following command to rerun just the provisioning step and update the inventory.

    $ vagrant provision

Create the new environment for the VM:

    $ ./scripts/create_new_environment.sh environments/vm

Edit the `environments/vm/group_vars/webmail.yml` file and change the values you need.



Run the playbook "site.yml": 

    $ ansible-playbook site.yml -i environments/vm/inventory

Once the playbbok has been run, you have two tools installed: horde and postfixadmin.
You can reach postfixadmin 

You can login to the VM using `$ vagrant ssh`


# Note: Ansible-tools

This Ansible / Vagrant playbook is base on the Ansible_playbook project by Pieter van der Meulen.

Ansible-tools serves as a starting point and an example of an 
[Ansible playbook](http://docs.ansible.com/ansible/playbooks.html) with some tools added that
make it easier to use the same playbooks and roles for multiple **environments**. 

In this context an [**environment**](id:environment) is a server or set of servers i.e. your production environment, 
your staging environment or your local development environment. It is not related to the environment variables like 
PATH or HOME that are used by an operating system.

Ansible-tools demonstrates a way to use Ansible to effectively and securely manage multiple environments ranging 
from development to production using the same playbook.

Ansible-tools provides:

- Vagrant integration for creating a local development VM
- An automated way to create a new environment, including generating passwords and certificates
- Optional encryption of the passwords and private keys in an environment using a symmetric key (keyczar)

The setup used by Ansible-tools assumes that you will be managing multiple similar environments. It can be used to
manage a single environment of course, and the use of Vagrant and a keyczar based vault is entirely optional.

Suggestions, improvements or critique welcome.
Please refer to the https://github.com/pmeulen/ansible-tools project for more details.
