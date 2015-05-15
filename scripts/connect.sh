#!/usr/bin/env sh
# Connect to ODL Karaf shell. Mostly used for testing.

# Port that the Karaf shell listens on
KARAF_SHELL_PORT=8101

# This could be done with public key crypto, but sshpass is easier
if ! command -v sshpass &> /dev/null; then
    echo "Installing sshpass. It's used connecting non-interactively"
    if ! sudo yum install -y sshpass; then
        echo "Couldn't find sshpass pkg, trying to install EPEL"
        if sudo yum install -y epel-release; then
            echo "Installed EPEL, re-attempting to install sshpass"
            sudo yum install -y sshpass
        else
            echo "Failed to install sshpass and EPEL, giving up"
            exit 1
        fi
    fi
fi

echo "Will repeatedly attempt connecting to Karaf shell until it's ready"
# Loop until exit status 0 (success) given by Karaf shell
# Exit status 255 means Karaf shell isn't open for SSH connections yet
# Exit status 1 means `dropAllPacketsRpc on` isn't runnable yet
until sshpass -p karaf ssh -p $KARAF_SHELL_PORT -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o PreferredAuthentications=password karaf@localhost
do
    echo "Karaf shell isn't ready yet, sleeping 5 seconds..."
    sleep 5
done
