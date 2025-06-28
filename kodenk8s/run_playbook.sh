#!/bin/bash

ansible-playbook playbook/update.yml -i inventory/hosts --ask-become-pass
