#!/bin/bash
# This script is run after recovery_1st_stage to start Standby node.

set -o xtrace

DEST_NODE_HOST="$1"
DEST_NODE_PGDATA="$2"

PGHOME=/usr/pgsql-13
POSTGRESQL_STARTUP_USER=postgres
SSH_KEY_FILE=id_rsa_pgpool
SSH_OPTIONS="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~/.ssh/${SSH_KEY_FILE}"

echo pgpool_remote_start: start: remote start Standby node $DEST_NODE_HOST

## Test passwordless SSH
ssh -T ${SSH_OPTIONS} ${POSTGRESQL_STARTUP_USER}@${DEST_NODE_HOST} ls /tmp > /dev/null

if [ $? -ne 0 ]; then
    echo ERROR: pgpool_remote_start: passwordless SSH to ${POSTGRESQL_STARTUP_USER}@${DEST_NODE_HOST} failed. Please setup passwordless SSH.
    exit 1
fi

## Start Standby node
ssh -T ${SSH_OPTIONS} ${POSTGRESQL_STARTUP_USER}@${DEST_NODE_HOST} "
    $PGHOME/bin/pg_ctl -l /dev/null -w -D $DEST_NODE_PGDATA start
"

if [ $? -ne 0 ]; then
    echo ERROR: pgpool_remote_start: $DEST_NODE_HOST PostgreSQL start failed.
    exit 1
fi

echo pgpool_remote_start: end: PostgreSQL on $DEST_NODE_HOST is started successfully.
exit 0