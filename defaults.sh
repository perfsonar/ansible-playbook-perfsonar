#/bin/sh

if [ "$1" == "" ]; then
  directory="inventory"
else
  directory=$1
fi

mkdir -p $directory/group_vars
mkdir -p $directory/host_vars

if ! [ -e "$directory/hosts" ]; then
    curl -s -o "$directory/hosts" \
        "https://raw.githubusercontent.com/perfsonar/ansible-playbook-perfsonar/master/inventory/hosts"
fi

if ! [ -f $directory/group_vars/ps_archive.yml ]; then
  cp roles/ansible-role-perfsonar-archive/defaults/main.yml \
    $directory/group_vars/ps_archive.yml
fi

if ! [ -f $directory/group_vars/ps_installer.yml ]; then
  cp roles/ansible-role-perfsonar-installer/defaults/main.yml \
    $directory/group_vars/ps_installer.yml
fi

if ! [ -f $directory/group_vars/ps_maddash.yml ]; then
  cp roles/ansible-role-perfsonar-maddash/defaults/main.yml \
    $directory/group_vars/ps_maddash.yml
fi

if ! [ -f $directory/group_vars/ps_psconfig-publisher.yml ]; then
  cp roles/ansible-role-perfsonar-psconfig-publisher/defaults/main.yml \
    $directory/group_vars/ps_psconfig_publisher.yml
fi

if ! [ -f $directory/group_vars/ps_pwa.yml ]; then
  cp roles/ansible-role-perfsonar-psconfig-web-admin/defaults/main.yml \
    $directory/group_vars/ps_psconfig_web_admin.yml
fi

if ! [ -f $directory/group_vars/ps_testpoint.yml ]; then
  cp roles/ansible-role-perfsonar-testpoint/defaults/main.yml \
    $directory/group_vars/ps_testpoint.yml
fi

if ! [ -f $directory/group_vars/ps_toolkit.yml ]; then
  cp roles/ansible-role-perfsonar-toolkit/defaults/main.yml \
    $directory/group_vars/ps_toolkit.yml
fi
