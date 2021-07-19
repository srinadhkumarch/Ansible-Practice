# Ansible playbook commands
ansible-playbook {playbookfilelocation}
ansible-playbook --check, --diff, --list-hosts, --list-tasks, and --syntax-check -vvv
ansible-galaxy install -r requirements.yml
ansible-vault encrypt hosts
ansible-vault decrypt hosts
ansible-playbook {{playbook file}} -i {{encrypted valut host file}} --ask-vault-pass
ansible-playbook {{playbook file}} -i {{encrypted valut host file}} --vault-password-file {{vault password file}}