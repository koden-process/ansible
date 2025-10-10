#!/bin/bash

# Script principal dnsmasq - Installation et configuration
echo "🚀 Installation et configuration dnsmasq sur koden0"
echo "📋 Ce script va :"
echo "   - Détecter automatiquement l'interface réseau"
echo "   - Configurer dnsmasq pour *.amazone.lan → 10.0.0.200"
echo "   - Configurer le relais DNS vers 8.8.8.8 et 1.1.1.1"
echo "   - Démarrer le service"
echo ""

read -p "✅ Continuer ? (y/N): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🔧 Installation en cours..."
    ansible-playbook playbook/dnsmasq.yml -i inventory/hosts --ask-become-pass
    
    echo ""
    echo "🧪 Lancer les tests maintenant ? (y/N): "
    read -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🧪 Tests en cours..."
        ansible-playbook playbook/dnsmasq_test.yml -i inventory/hosts --ask-become-pass
    fi
else
    echo "❌ Installation annulée"
    exit 1
fi