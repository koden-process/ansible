#!/bin/bash

ansible-playbook playbook/k8s_cleanup.yml -i inventory/hosts --ask-become-pass