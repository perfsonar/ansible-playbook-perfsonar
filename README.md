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

