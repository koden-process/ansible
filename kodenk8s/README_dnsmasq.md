# DNS Masq pour Koden0

Configuration automatique de dnsmasq sur koden0 pour résoudre le domaine `*.amazone.lan` vers `10.0.0.200`.

## 🚀 Installation

```bash
./install_dnsmasq.sh
```

Ce script va :
- Détecter automatiquement l'interface réseau principale
- Installer et configurer dnsmasq 
- Configurer `*.amazone.lan → 10.0.0.200`
- Configurer le relais DNS vers `8.8.8.8` et `1.1.1.1`
- Démarrer le service

## 🔍 Diagnostic

```bash
./diagnostic_dnsmasq.sh
```

Affiche l'état des services, ports utilisés, logs, etc.

## 🧪 Tests

```bash
./test_dnsmasq.sh
```

Teste la résolution DNS locale et externe.

## 📁 Fichiers

- `playbook/dnsmasq.yml` - Playbook principal d'installation
- `playbook/dnsmasq_diagnostic.yml` - Diagnostic système
- `playbook/dnsmasq_test.yml` - Tests de résolution DNS

## 📋 Configuration

Le domaine et l'IP sont configurés dans les variables du playbook :
- `dns_domain: "amazone.lan"`
- `dns_ip: "10.0.0.200"`
- `upstream_dns: ["8.8.8.8", "1.1.1.1"]`