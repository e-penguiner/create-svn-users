#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 user_file"
    exit 1
fi

USER_FILE="$1"
HTPASSWD_FILE="/etc/subversion/svn.users"

> $HTPASSWD_FILE

while IFS=: read -r user pass; do
    htpasswd -b $HTPASSWD_FILE $user $pass
done < $USER_FILE
