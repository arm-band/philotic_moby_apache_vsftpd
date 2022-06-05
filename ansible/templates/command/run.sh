#!/bin/bash

ansible-playbook -i /ansible/targets/hosts /ansible/main.yml -u SSH_REMOTEUSER --private-key="/root/.ssh/KEY_NAME" -K
