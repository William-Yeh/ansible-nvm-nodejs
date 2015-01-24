#!/bin/bash
# simple script to query the version of Node.js via NVM.
#
# @return: JSON format
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


NVM_EXE_PATH=${1:-/opt/nvm/nvm.sh}


#
# error handling
#

function do_error_exit {
    echo { \"ok\": false, \"status\": $RETVAL, \"error_line\": $BASH_LINENO }
    exit
}

trap 'RETVAL=$?;  do_error_exit '  ERR



# enable NVM
source $NVM_EXE_PATH  > /dev/null 2>&1


# query versions
VERSION_CURRENT=$(nvm current)

VERSION_DEFAULT_RAW=$(nvm alias default)
if [[ $VERSION_DEFAULT_RAW =~ ([^[:blank:]]+)$ ]]; then
    #echo ${BASH_REMATCH[1]}
    VERSION_DEFAULT=${BASH_REMATCH[1]}
else
    VERSION_DEFAULT=$VERSION_CURRENT
fi


# output result in JSON format
cat <<EOF
{ "ok": true,
  "version": {
    "default": "$VERSION_DEFAULT",
    "current": "$VERSION_CURRENT"
  }
}
EOF
