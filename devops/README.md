# Ansible "Workstation installation"

Pour jouer le playbook run
```
ansible-playbook playbooks/workstation.yml -i inventory/development.yml
```

Pour jouer sur une machine local et demander le mot de passe root
```
cd playbooks
ansible-playbook -i ../inventory/local.yml workstation.yml --ask-become-pass
```

