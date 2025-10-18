# K3s Version Pin and Playbooks

This repository pins K3s to version `v1.32.6+k3s1` across all nodes.

## Key playbooks

- `playbook/k3s_install.yml`: Installs K3s on koden0-3, pins the exact version, and ensures worker join also uses the same version.
- `playbook/k3s_version_fix.yml`: Upgrades master and workers to the pinned target version and verifies the cluster status.
- `playbook/k3s_workers_downgrade.yml`: Aligns workers to the master's version (currently pinned to `v1.32.6+k3s1`).
- `playbook/k3s_fix_certificates.yml`: Reinstalls workers and refreshes certificates, pinned to the target version.

## Typical flows

- Align only workers to the master version:

```bash
ansible-playbook playbook/k3s_workers_downgrade.yml -i inventory/hosts --ask-become-pass
```

- Upgrade/align master and workers to target version:

```bash
ansible-playbook playbook/k3s_version_fix.yml -i inventory/hosts --ask-become-pass
```

- Fresh install on koden0-3:

```bash
./deploy_k3s.sh
```

## Verify

```bash
ansible -i inventory/hosts k8s_nodes -m shell -a "/usr/local/bin/k3s --version | head -1"
```

## Notes

- The pinned version can be changed in the playbooks via the `k3s_version`/`target_k3s_version` variables.
- For more robust linting, consider replacing `curl | sh` with `get_url` + `command` or using a dedicated K3s role.
