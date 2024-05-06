#!/bin/sudo /bin/bash

if ! [ $(id -u) = 0 ]; then
    echo "Use it like './HackScript.sh' or run with 'sudo bash HackScript.sh'"
    exit 1
fi


echo "Hello root! This script can delete the HackScript.sh virus at your device!"

systemctl disable HackScript.sh
systemctl stop HackScript.sh

rm -r -f /opt/HackScript.sh > /dev/null
rm -r -f /etc/systemd/system/HackScript.sh.service > /dev/null

systemctl daemon-reload