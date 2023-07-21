#!/usr/bin/env bash

. "/usr/local/bin/provisioner.sh"

if grep -q $PROJECT_NAME "$RESOLV_FILE"
    then
        exit 0
    else
        _newline
fi
