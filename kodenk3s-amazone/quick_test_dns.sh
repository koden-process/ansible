#!/bin/bash

# Test rapide de la résolution DNS spécifique
echo "🧪 Test rapide des résolutions DNS..."

echo ""
echo "🔍 Test 1: domaine général amazone.lan"
ansible k8s_master -i inventory/hosts -m shell -a "nslookup test.amazone.lan 127.0.0.1" --ask-become-pass

echo ""
echo "🔍 Test 2: domaine spécifique stormshield.amazone.lan"
ansible k8s_master -i inventory/hosts -m shell -a "nslookup stormshield.amazone.lan 127.0.0.1" --ask-become-pass

echo ""
echo "🔍 Test 3: domaine externe (google.com)"
ansible k8s_master -i inventory/hosts -m shell -a "nslookup google.com 127.0.0.1" --ask-become-pass