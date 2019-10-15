#/bin/sh

if [ "$1" == "" ]; then
  directory="inventory"
else
  directory=$1
fi
#echo $directory/group_vars/all/perfsonar/ps_archive.yml
#exit

mkdir -p $directory/group_vars/all/perfsonar
mkdir -p $directory/host_vars/

wget -q -P $directory -nc \
  https://raw.githubusercontent.com/perfsonar/ansible-playbook-perfsonar/master/inventory/hosts

if ! [ -f $directory/group_vars/all/perfsonar/ps_archive.yml ]; then
  cp roles/ansible-role-perfsonar-archive/defaults/main.yml \
    $directory/group_vars/all/perfsonar/ps_archive.yml
fi

if ! [ -f $directory/group_vars/all/perfsonar/ps_installer.yml ]; then
  cp roles/ansible-role-perfsonar-installer/defaults/main.yml \
    $directory/group_vars/all/perfsonar/ps_installer.yml
fi

if ! [ -f $directory/group_vars/all/perfsonar/ps_maddash.yml ]; then
  cp roles/ansible-role-perfsonar-maddash/defaults/main.yml \
    $directory/group_vars/all/perfsonar/ps_maddash.yml
fi

if ! [ -f $directory/group_vars/all/perfsonar/ps_psconfig-publisher.yml ]; then
  cp roles/ansible-role-perfsonar-psconfig-publisher/defaults/main.yml \
    $directory/group_vars/all/perfsonar/ps_psconfig-publisher.yml
fi

if ! [ -f $directory/group_vars/all/perfsonar/ps_pwa.yml ]; then
  cp roles/ansible-role-perfsonar-psconfig-web-admin/defaults/main.yml \
    $directory/group_vars/all/perfsonar/ps_pwa.yml
fi

if ! [ -f $directory/group_vars/all/perfsonar/ps_testpoint.yml ]; then
  cp roles/ansible-role-perfsonar-testpoint/defaults/main.yml \
    $directory/group_vars/all/perfsonar/ps_testpoint.yml
fi

if ! [ -f $directory/group_vars/all/perfsonar/ps_toolkit.yml ]; then
  cp roles/ansible-role-perfsonar-toolkit/defaults/main.yml \
    $directory/group_vars/all/perfsonar/ps_toolkit.yml
fi
