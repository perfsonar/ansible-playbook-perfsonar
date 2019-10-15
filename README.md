playbook for perfSONAR deployment and config

**Quick Start**:

Clone this repository:

```
git clone https://github.com/perfsonar/ansible-playbook-perfsonar.git
cd ansible-playbook-perfsonar
```

Get the required roles (note that we ignore errors so we can run this multiple times):

```
ansible-galaxy install -r  requirements.yml --ignore-errors
```

Set up your inventory.  Connection variables can be added here as well.

```
vi inventory/hosts
```

Set up perfSONAR variables by running the defaults.sh script and then editing them:

```
./defaults.sh
vi inventory/group_vars/all/*
```

Set up individual host variables with the lsregistration.yml template

```
mkdir inventory/host_vars/myhostname
cp roles/ansible-role-perfsonar-testpoint/defaults/lsregistration.yml \
  inventory/host_vars/myhostname
vi inventory/host_vars/myhostname/lsregistration.yml
```

Run the playbook:

```
ansible-playbook perfsonar.yml
```

---

**Some useful commands to manage the environment**

Use Ansible ping to verify connectivity to targets:

```
ansible all -m ping
```

Manage PWA users:
```
vi /inventory/group_vars/all/perfsonar/ps_pwa.yml
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
