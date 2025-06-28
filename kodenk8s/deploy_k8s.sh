#!/bin/bash

# Script to deploy Kubernetes cluster on the mini-PCs
# This will run the k8s_deploy.yml playbook with the appropriate options

echo "Starting Kubernetes cluster deployment..."
ansible-playbook playbook/k8s_deploy.yml -i inventory/hosts --ask-become-pass

echo "Deployment complete. Check the output above for the cluster status."
echo "You can access the cluster from the control plane node (koden0) using kubectl."