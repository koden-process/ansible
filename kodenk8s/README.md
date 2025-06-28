# Kubernetes Cluster Deployment with Ansible

This project contains Ansible playbooks to deploy a Kubernetes cluster on 4 identical mini-PCs.

## Overview

The deployment sets up a Kubernetes cluster with:
- 1 control plane node (master)
- 3 worker nodes
- Calico as the network plugin
- Containerd as the container runtime

## Prerequisites

- 4 identical mini-PCs with a Debian-based Linux distribution (Ubuntu recommended)
- SSH access to all nodes
- Ansible installed on your control machine
- Sudo privileges on all nodes

## Inventory

The inventory file (`inventory/hosts`) defines the 4 nodes:
- koden0 (10.0.0.200) - Will be configured as the control plane
- koden1 (10.0.0.201) - Will be configured as a worker node
- koden2 (10.0.0.202) - Will be configured as a worker node
- koden3 (10.0.0.203) - Will be configured as a worker node

## Deployment

To deploy the Kubernetes cluster, run:

```bash
./deploy_k8s.sh
```

This script will:
1. Run the Ansible playbook with the appropriate options
2. Prompt for the sudo password
3. Deploy the Kubernetes cluster

## Playbook Details

The `k8s_deploy.yml` playbook performs the following steps:

1. **Common Setup for All Nodes**:
   - Updates package cache
   - Installs prerequisites
   - Disables swap
   - Configures kernel modules and parameters
   - Installs containerd as the container runtime
   - Installs Kubernetes components (kubelet, kubeadm, kubectl)

2. **Control Plane Initialization**:
   - Initializes the Kubernetes cluster on koden0
   - Sets up kubectl configuration
   - Installs Calico network plugin
   - Generates join command for worker nodes

3. **Worker Nodes Setup**:
   - Joins worker nodes to the cluster

4. **Verification**:
   - Waits for all nodes to be ready
   - Displays cluster status

## Maintenance

To update all nodes in the cluster, run:

```bash
./run_playbook.sh
```

This will update and upgrade all packages on all nodes.

## Accessing the Cluster

After deployment, you can access the cluster from the control plane node (koden0) using kubectl:

```bash
ssh skit@10.0.0.200
kubectl get nodes
```

## Troubleshooting

If you encounter issues during deployment:

1. Check connectivity to all nodes
2. Ensure all nodes have sufficient resources (CPU, memory, disk)
3. Verify that swap is disabled on all nodes
4. Check the Kubernetes and containerd logs:
   ```
   journalctl -xeu kubelet
   journalctl -xeu containerd
   ```