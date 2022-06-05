#!/bin/bash

PUBKEY_NAME="${1}.pub"
ORIGIN_PATH="/rsakey/"
COPY_PATH="/root/.ssh/"

# ssh key generating
if [ ! -e $ORIGIN_PATH${1} ]; then
    sudo ssh-keygen -t rsa -b 4096 -f $ORIGIN_PATH${1} -N ""
    echo "success: generating ssh key"
else
    echo "no operation: ssh key"
fi

# dir
if [ ! -d $COPY_PATH ]; then
    # mkdir
    sudo mkdir $COPY_PATH
    # chmod
    sudo chmod 600 $COPY_PATH
    echo "success: mkdir"
else
    echo "no operation: mkdir"
fi

if [ ! -e $COPY_PATH${1} ]; then
    # file copy
    sudo cp $ORIGIN_PATH${1} $COPY_PATH${1}

    # chown
    sudo chown root:root $COPY_PATH${1}

    # chmod
    sudo chmod 600 $COPY_PATH${1}

    echo "success: copy ssh private key"
else
    echo "no operation: copy ssh private key"
fi

if [ ! -e $COPY_PATH$PUBKEY_NAME ]; then
    # file copy
    sudo cp $ORIGIN_PATH$PUBKEY_NAME $COPY_PATH$PUBKEY_NAME

    # chown
    sudo chown root:root $COPY_PATH$PUBKEY_NAME

    # chmod
    sudo chmod 600 $COPY_PATH$PUBKEY_NAME

    echo "success: copy ssh private key"
else
    echo "no operation: copy ssh public key"
fi

# ansible command shortcut
sed -e "s/KEY_NAME/${1}/gi" \
    -e "s/SSH_REMOTEUSER/${2}/gi" \
       /ansible/templates/command/run.sh > /command_ansible/run.sh
sed -e "s/KEY_NAME/${1}/gi" \
    -e "s/SSH_REMOTEUSER/${2}/gi" \
       /ansible/templates/command/dryrun.sh > /command_ansible/dryrun.sh
sed -e "s/KEY_NAME/${1}/gi" \
    -e "s/SSH_REMOTEUSER/${2}/gi" \
       /ansible/templates/command/rollback.sh > /command_ansible/rollback.sh
chmod 700 /command_ansible/run.sh
chmod 700 /command_ansible/dryrun.sh
chmod 700 /command_ansible/rollback.sh