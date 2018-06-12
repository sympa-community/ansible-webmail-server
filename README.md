# Webmail server for Sympa development

This Ansible playbook deploys a horde groupware edition webamil on a VM. The purpose of such a webmail is to be able to send to and receive mail from a Sympa development server.

While developing features and fixing bugs it is often handy to be able to send mails to check that a process is correctly handled by Sympa. This is easier on a development environement and especially if you don't have to hanlde mail routing from your development machine to your Sympa development servers.

This Ansible playbooks creates a local virtual machine on your computer, that you can easily setup to send and receive mail only to a Sympa server. The same tweaking is possible on the community-supported Sympa Ansbile playbook.

This playbook is designed to be used with the Sympa server deployed using the Sympa-ansible (https://github.com/sympa-community/sympa-ansible) playbook. You can certainly use it with another server but you might have troubles with antispam / DNS resolution on the way between te webmail and the Sympa server.

# [Quickstart: Creating a development VM](id:quickstart)

First install the tools on your local machine:

* Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org). Virtualbox will run 
  the development VM and Vagrant is used to create, configure and manage the development VM instance.
* Install [Ansible](http://www.ansible.com). There are several ways to install Ansible. They are described in the 
  [Ansible installation guide](http://docs.ansible.com/ansible/intro_installation.html). **Ansible 2.5 is required for the include-role feature to be used**

Clone or download this repository to your local machine if you haven't already. Next change into the "ansible-webmail-server" 
directory (i.e. where this README is located) and create and start the development VM: 

    $ vagrant up

This prepares a VM that is ready to be managed by Ansible. It will call a simple Ansible playbook to make some changes to the VM. 
Run the following command to rerun just the provisioning step and update the inventory.

    $ vagrant provision

Create the new environment for the VM:

    $ ./scripts/create_new_environment.sh environments/vm

Edit the `environments/vm/group_vars/webmail.yml` file and change the values you need. The only parameter you would likely change are :
  - `ispmail_list_servers`: it contains a list of lists servers whose IP and domains will be written to the webmail /etc/hosts file.
  - `ispmail_outgoing_server`: if set, any outgoing mail will be sent to this IP. It allows to send email to the list server without being bothered by "reality" such as DNS declarations. Set it to your Sympa development server IP address.
  - `ispmail_webmail_hostname`: the domain to be used by the fake email adresses you will be using.
  - `ispmail_users`: an array of user/password. username is the local part of email address; password is the password used to log in to Horde.
  - `ispmail_admin_users`: You certainly need only one. This is the webmail administrator address. You will use it in Postfixadmin to manage email accounts.
  
There are oher parameters in the config file, but you probably won't need them, except if you plan to use this playbook to ceate an actual production webmail. WARNING: though it is certainly possible, this playbook was not written with production in mind. If you want to use it for thi purpose anyway, please consider changing the default configurations accordingly.

Run the playbook "site.yml": 

    $ ansible-playbook site.yml -i environments/vm/inventory

You can login to the VM using `$ vagrant ssh`

Finally, edit the `/etc/hosts` on your computer. It must resolve your webmail domain with the webmail VM IP.
By default, you should have this:

    192.168.66.66 webmail.com

Once the playbbok has been run, you have two tools installed: horde and postfixadmin.

## Postfixadmin

You can reach postfixadmin through: https://<ispmail_webmail_hostname>/postfixadmin/
Authenticate using the admin logins defined in `ispmail_admin_users` (<ispmail_admin_users.username>@<ispmail_webmail_hostname> / <ispmail_admin_users.password>)

## Horde

You can reach Horde through: https://<ispmail_webmail_hostname>/horde/
Authenticate using the logins defined in `ispmail_users` (<ispmail_users.username>@<ispmail_webmail_hostname> / <ispmail_users.password>)

# Adapt the Sympa VM

The Sympa development list server must be tune to use this webmail as unique destnation for all emails. You'll do it by setting the following parameter:
In `environments/template/group_vars/sympa.yml`, The following parameters must have the same values:

    sympa_force_smtp_route: 1

    sympa_incoming_smtp: '192.168.66.66'

    sympa_outgoing_server: "{{ sympa_incoming_smtp }}"

The re-run the site.yml playbook.
Your Sympa server will now send message to the webmail, and accept messages from it.

# Sympa/webmail coupling check

Please be careful:
  - The IP for `sympa_incoming_smtp` in the Sympa playbook MUST be the IP of your webmail server.
  - The IP for `ispmail_outgoing_server` in the webmail playbook MUST be the IP of your Sympa server.

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
