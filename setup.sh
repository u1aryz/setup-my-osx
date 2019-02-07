#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

ansible-playbook -i $SCRIPT_DIR/hosts $SCRIPT_DIR/localhost.yml --ask-become-pass -e "user=`whoami`"
