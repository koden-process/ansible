#!/bin/bash

# Script de diagnostic dnsmasq simplifié
echo "🔍 Diagnostic rapide dnsmasq..."
ansible-playbook playbook/dnsmasq_diagnostic.yml -i inventory/hosts --ask-become-pass