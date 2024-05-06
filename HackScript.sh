#!/bin/sudo /bin/bash

if ! [ $(id -u) = 0 ]; then
    echo "Use it like './HackScript.sh' or run with 'sudo bash HackScript.sh'"
    exit 1
fi


echo "Hello root! This script can install a virus at your device!"
echo "It will create a service which can run your CPU very high!"

read -p "Do you really want to continue? [y/N] " choice
case "$choice" in
  [yY] ) 
    echo "Continue..."
    ;;
  * )
    echo "Canceled!"
    exit 1
    ;;
esac

echo -n "Looking for stress.sh..."
if [ -f "stress.sh" ]; then
    echo "Existing."
else
    echo "Not existing! Make sure that you downloaded the pack completely!"
    exit 2
fi
echo -n "Looking for HackScript.sh.service..."
if [ -f "HackScript.sh.service" ]; then
    echo "Existing."
else
    echo "Not existing! Make sure that you downloaded the pack completely!"
    exit 2
fi

chmod +x stress.sh

mkdir /opt/HackScript.sh > /dev/null
cp -f stress.sh /opt/HackScript.sh/stress.sh > /dev/null
chmod +x /opt/HackScript.sh/stress.sh

cp -f HackScript.sh.service /etc/systemd/system/ > /dev/null

systemctl daemon-reload
systemctl enable HackScript.sh
systemctl start HackScript.sh