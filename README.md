playbook for perfSONAR deployment and config

**Quick Start**:

Clone this repository:

    git clone git@github.com:epcjr/ansible-perfsonar-deploy.git
    cd ansible-perfsonar-deploy

Get the required roles (note that we ignore errors so we can run this multiple times):

    ansible-galaxy install -r  requirements.yml --ignore-errors

Set up your invintory:

    vi invintory/hosts

Set up perfSONAR variables:

    vi inventory/group_vars/all/perfsonar.yml

Set up connection variables (might need to handle vault secrets):

    vi inventory/group_vars/all/login.yml
    
Run the playbook:

    ansible-playbook --ask-vault-pass perfsonar.yml


