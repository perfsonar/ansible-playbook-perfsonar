playbook for perfSONAR deployment and config

**Quick Start**:

Clone this repository:

    git clone git@github.com:perfsonar/ansible-playbook-perfsonar.git
    cd ansible-playbook-perfsonar

Get the required roles (note that we ignore errors so we can run this multiple times):

    ansible-galaxy install -r  requirements.yml --ignore-errors

Set up your invintory.  Connection variables can be added here as well.

    vi invintory/hosts

Set up perfSONAR variables by running the defaults.sh script and then editing them:

    ./defaults.sh
    vi inventory/group_vars/all/*

Set up individual host variables with the lsregistration.yml template

    cp inventory/lsregistration.yml inventory/host_vars/myhostname.yml
    vi inventory/host_vars/myhostname.yml

Run the playbook:

    ansible-playbook perfsonar.yml


