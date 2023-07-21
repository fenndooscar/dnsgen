#!/usr/bin/env bash

#which my current ip
CURRENT_IP=`ip addr show  eth0 | grep inet | awk '{print $2}' | awk -F"/" '{print $1}'`
RESOLV_FILE=/host/etc/resolv.conf

#delete old line
_cleanup () {
  cat $RESOLV_FILE | sed  "/$PROJECT_NAME/d" > $RESOLV_FILE.tmp
  cat $RESOLV_FILE.tmp > $RESOLV_FILE
}
#update line
_newline () {
  cat $RESOLV_FILE | sed "1s/^/nameserver $CURRENT_IP #$PROJECT_NAME\n/" $RESOLV_FILE > $RESOLV_FILE.tmp
  cat $RESOLV_FILE.tmp > $RESOLV_FILE
}
