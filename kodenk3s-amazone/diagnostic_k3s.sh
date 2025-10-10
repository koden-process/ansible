#!/bin/bash

# Script de diagnostic K3s
echo "=== Diagnostic du cluster K3s ==="

# Vérifier la connectivité SSH
echo "1. Test de connectivité SSH vers les nœuds workers..."
for host in koden1 koden2 koden3; do
    echo "Test SSH vers $host..."
    ssh -o ConnectTimeout=5 skit@10.0.0.20${host: -1} "echo 'SSH OK sur $host'" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "✓ SSH OK vers $host"
    else
        echo "✗ SSH KO vers $host"
    fi
done

echo ""
echo "2. Vérification des versions K3s..."
kubectl get nodes -o custom-columns=NAME:.metadata.name,VERSION:.status.nodeInfo.kubeletVersion,STATUS:.status.conditions[-1].type

echo ""
echo "3. État des services sur les workers (via SSH)..."
for i in 1 2 3; do
    host="koden${i}"
    ip="10.0.0.20${i}"
    echo "=== $host ==="
    ssh -o ConnectTimeout=5 skit@$ip "sudo systemctl status k3s-agent --no-pager | head -10" 2>/dev/null || echo "Échec connexion SSH ou commande"
done

echo ""
echo "4. Logs récents des agents K3s..."
for i in 1 2 3; do
    host="koden${i}"
    ip="10.0.0.20${i}"
    echo "=== Logs $host ==="
    ssh -o ConnectTimeout=5 skit@$ip "sudo journalctl -u k3s-agent --no-pager -l | tail -5" 2>/dev/null || echo "Échec récupération logs"
done