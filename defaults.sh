#/bin/sh
mkdir -p inventory/group_vars/all
mkdir -p inventory/host_vars/
cp -i roles/ansible-role-perfsonar-archive/defaults/main.yml \
  inventory/group_vars/all/ps_archive.yml
cp -i roles/ansible-role-perfsonar-installer/defaults/main.yml \
  inventory/group_vars/all/ps_installer.yml
cp -i roles/ansible-role-perfsonar-maddash/defaults/main.yml \
  inventory/group_vars/all/ps_maddash.yml
cp -i roles/ansible-role-perfsonar-psconfig-publisher/defaults/main.yml \
  inventory/group_vars/all/ps_psconfig-publisher.yml
cp -i roles/ansible-role-perfsonar-psconfig-web-admin/defaults/main.yml \
  inventory/group_vars/all/ps_pwa.yml
cp -i roles/ansible-role-perfsonar-testpoint/defaults/main.yml \
  inventory/group_vars/all/ps_testpoint.yml
cp -i roles/ansible-role-perfsonar-toolkit/defaults/main.yml \
  inventory/group_vars/all/ps_toolkit.yml
