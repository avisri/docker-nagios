!/bin/bash
### In postfix.sh (make sure this file is chmod +x):
# `chpst -u root` runs the given command as the user `xxxxx`.
# If you omit that part, the command will be run as root.

 daemon_directory=/usr/lib/sbin/postfix
 command_directory=/usr/sbin
 config_directory=/etc/postfix
 queue_directory=/var/spool/postfix
 mail_owner=postfix
 setgid_group=postdrop


exec /usr/lib/postfix/sbin/master  2>&1
