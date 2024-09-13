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

## driver alpha networks
https://youtu.be/C4vhPgL1Ve0

lsusb
ifconfig
apt-get update
apt-get upgrade
apt-get dist-upgrade -y
apt-get install realtek-rtl88xxau-dkms
lsusb
ifconfig
iwconfig