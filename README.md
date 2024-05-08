An Ansible playbook to ease perfSONAR deployment and configuration.

## Quick Start

Clone this repository:

```
git clone https://github.com/perfsonar/ansible-playbook-perfsonar.git
cd ansible-playbook-perfsonar
```

Get the required roles (note that we ignore errors so we can run this multiple times):

```
ansible-galaxy install -r  requirements.yml --ignore-errors
```

Set up perfSONAR variables by running the `defaults.sh` script and then editing them:

```
./defaults.sh
vi inventory/group_vars/ps_*
```

Set up your inventory.  Connection variables can be added here as well, for example `ansible_host` and `ansible_user`).

```
vi inventory/hosts
```

Set up individual host variables with the `lsregistration.yml` template

```
mkdir inventory/host_vars/myhostname
cp roles/ansible-role-perfsonar-testpoint/defaults/lsregistration.yml \
  inventory/host_vars/myhostname
vi inventory/host_vars/myhostname/lsregistration.yml
```

Run the playbook:

```
ansible-playbook -K perfsonar.yml
```
(remove the `-K` if you don't need to provide any sudo password)

---

### Some useful commands to manage the environment

Use Ansible ping to verify connectivity to targets:

```
ansible all -m ping
```

### perfSONAR Web Admin (PWA) management
Manage PWA users:
```
vi /inventory/group_vars/ps_pconfig_web_admin.yml
ansible-playbook \
  --limit 'ps-psconfig-web-admin' --tags 'ps::pwa_users'\
  perfsonar.yml
```

Display PWA users:
```
ansible ps-psconfig-web-admin \
  -a "docker exec -it sca-auth pwa_auth listuser --short"
```

Display PWA users, all atributes:
```
ansible ps-psconfig-web-admin \
  -a "docker exec -it sca-auth pwa_auth listuser"
```
  
Reset Password for PWA user from the command line:
```
ansible ps-psconfig-web-admin \
  -a "docker exec -it sca-auth pwa_auth setpass \
  --username user --password newpasswd"
```

Reset Password for PWA user interactively:
```
ansible-playbook \
  roles/ansible-role-perfsonar-psconfig-web-admin/playbooks/pwa_passwd_reset.yml
```

## Branching and versioning for perfSONAR Ansible playbooks and roles
In each of our perfSONAR Ansible repositories, i.e. this one and all the roles that we provide, you'll find the following:

 - branches:
   - master: is our lastest code, this is usually what you want to use
   - 4.4, 5.0 or any 5.x: development branch to support features of newer versions
 - tags:
   - 4.4.6, 5.0.3 or any 5.x.y: identifying a commit in our Ansible bits and pieces that is known to work with the tagged version

Once development branches are feature complete, they'll get merged into the master/main branch.

