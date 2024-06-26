#!/bin/bash
# This line is to tell the interpreter to error out and quit further execution if any step fails
set -e
check_retry_count () {
  RETRY_COUNT=$1
  MAX_RETRY=10
  failed_db_host=$2
  if [ $RETRY_COUNT -eq $MAX_RETRY ]; then
     echo "Maximum retry for checking DB($failed_db_host) to be online is reached, exiting..."
     exit 3
  fi
}
db_host_names=("10.81.1.194" "10.81.1.195" "10.81.1.196")
for str in ${db_host_names[*]}; do
  RETRY_COUNT=0
  until nc -z $str 6432; do
    check_retry_count $RETRY_COUNT $str
    ((RETRY_COUNT=RETRY_COUNT+1))
    
    echo "$(date) - waiting for $str to be online..."
    sleep 3s
  done
  echo "** $str host is online, trying remaining hosts ***"
done
echo "* All the required DB hosts are online *"