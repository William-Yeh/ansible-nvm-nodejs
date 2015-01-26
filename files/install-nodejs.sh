#!/bin/bash
# simple script to install specific version of Node.js via NVM.
#
#
#------------------------------------------------------------------
# APACHE LICENSE V2.0
#
#  Copyright 2015  William Yeh <william.pjyeh@gmail.com>
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#------------------------------------------------------------------


NVM_EXE_PATH=$1
NODEJS_VERSION=$2


#
# error handling
#

function do_error_exit {
    echo { \"ok\": false, \"status\": $RETVAL, \"error_line\": $BASH_LINENO }
    exit
}

trap 'RETVAL=$?;  do_error_exit '  ERR



# enable NVM
source "$NVM_EXE_PATH"             > /dev/null 2>&1
nvm install $NODEJS_VERSION        > /dev/null 2>&1
nvm use $NODEJS_VERSION            > /dev/null 2>&1
nvm alias default $NODEJS_VERSION  > /dev/null 2>&1


# output result in JSON format
cat <<EOF
{ "ok": true }
EOF
