#!/bin/bash


set -e

if [ -f /etc/configured ]; then
        echo 'already configured'
        postfix start
else
      #code that need to run only one time ....
        
        #needed for fix problem with ubuntu and cron
        update-locale 
        postfix start
        date > /etc/configured
fi
