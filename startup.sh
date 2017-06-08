#!/bin/bash


set -e

if [ -f /etc/configured ]; then
        echo 'already configured'
        postfix start
else
      #code that need to run only one time ....
        #needed for fix problem with ubuntu and cron
        update-locale 
        echo 'root:  me@example.com' >>/etc/aliases
        newaliases
        #add container Network Docker0 and container ip to postfix configuration , it will fail is custom container network
        sed -i '/inet_interfaces/s/$/ '"$(cat /etc/hosts | grep $HOSTNAME| awk -F\  '{print $1}')"'/' /etc/postfix/main.cf
        sed -i '/mynetworks/s/$/ '"$(cat /etc/hosts | grep $HOSTNAME| awk -F. '{print $1 "." $2 ".0.0\/16"}')"'/' /etc/postfix/main.cf
        postfix start
        date > /etc/configured
fi
