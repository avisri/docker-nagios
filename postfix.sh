#!/bin/bash
### In postfix.sh (make sure this file is chmod +x):
# `chpst -u root` runs the given command as the user `xxxxx`.
# If you omit that part, the command will be run as root.

exec chpst -u postfix postfix start -d -c /etc/postfix 2>&1
