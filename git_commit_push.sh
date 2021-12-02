#!/bin/bash
#---------- init ----------
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"; SOURCE="$(readlink "$SOURCE")"; [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"; done
SCRIPTDIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
LIBSDIR=$SCRIPTDIR/ziglib
CFGDIR=$SCRIPTDIR/config
#DEBUG=true
source $LIBSDIR/ziglib_generic.sh
#ziglib logs fifo net sound dialog snmp
cd $SCRIPTDIR
#---------- /init ----------

echo -n Put comment:
if [ "$1" = "" ];then read comment; else comment="$@"; fi
git commit -a -m "$comment $(date +%F_%H-%M-%S_%N)"
git push