#!/bin/bash

FILENAME="PRIVATE_KEY"
PUBFILENAME="PRIVATE_KEY.pub"
ORIGINPATH="/workspace/"
COPYPATH="/root/.ssh/"

# ssh key generating
if [ ! -e $ORIGINPATH$FILENAME ]; then
    sudo ssh-keygen -t rsa -b 4096 -f $ORIGINPATH$FILENAME -N ""
    echo "success: generating ssh key"
else
    echo "no operation: ssh key"
fi

# dir
if [ ! -d $COPYPATH ]; then
    # mkdir
    sudo mkdir $COPYPATH
    # chmod
    sudo chmod 600 $COPYPATH
    echo "success: mkdir"
else
    echo "no operation: mkdir"
fi

if [ ! -e $COPYPATH$FILENAME ]; then
    # file copy
    sudo cp $ORIGINPATH$FILENAME $COPYPATH$FILENAME

    # chown
    sudo chown root:root $COPYPATH$FILENAME

    # chmod
    sudo chmod 600 $COPYPATH$FILENAME

    echo "success: copy ssh private key"
else
    echo "no operation: copy ssh private key"
fi

if [ ! -e $COPYPATH$PUBFILENAME ]; then
    # file copy
    sudo cp $ORIGINPATH$PUBFILENAME $COPYPATH$PUBFILENAME

    # chown
    sudo chown root:root $COPYPATH$PUBFILENAME

    # chmod
    sudo chmod 600 $COPYPATH$PUBFILENAME

    echo "success: copy ssh private key"
else
    echo "no operation: copy ssh public key"
fi
