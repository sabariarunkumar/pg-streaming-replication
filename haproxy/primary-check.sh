#!/bin/bash
VIP=$1
VPT=$2
RIP=$3

PG_MONITOR_USER=docker
PG_MONITOR_PASS=docker
PG_MONITOR_DB=docker

if [ "$4" == "" ]; then
  RPT=$VPT
else
  RPT=$4
fi

STATUS=$(PGPASSWORD="$PG_MONITOR_PASS" /usr/bin/psql -qtAX  -c "select pg_is_in_recovery()" -h "$RIP" -p "$RPT" -U "$PG_MONITOR_USER")


# current_time=$(/bin/date +"%T")
# echo "Current time: $current_time server="$RIP" port="$RPT"  status=$STATUS "


if [[ "$STATUS" == "f" ]]
then
  exit 0
else
  exit 1
fi
