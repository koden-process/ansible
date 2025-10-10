#!/bin/bash

# Script de test dnsmasq simplifié
echo "🧪 Test de résolution DNS..."
ansible-playbook playbook/dnsmasq_test.yml -i inventory/hosts --ask-become-pass