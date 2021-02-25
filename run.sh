#!/usr/bin/env bash

set -e # Abort script at first error
set -u # Attempt to use undefined variable outputs error message
set -x # Verbose with commands displayed


BUTTON=$(curl localhost |grep text)

echo $BUTTON
echo;

if [[ $BUTTON == '<p' 'id="text"></p>' ]]; then echo "good"; else echo "bad"; fi
