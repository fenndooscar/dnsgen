#!/usr/bin/env bash

. "/usr/local/bin/provisioner.sh"
_cleanup
_newline

trap '_cleanup' SIGTERM;
while true; do sleep 1 & wait $!; done
