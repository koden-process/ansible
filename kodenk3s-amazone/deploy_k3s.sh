#!/bin/bash

ansible-playbook playbook/k3s_install.yml -i inventory/hosts --ask-become-pass