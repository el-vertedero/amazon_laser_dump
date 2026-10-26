#!/system/bin/sh
HALO_PATH=/vendor/bin
[ -f ${HALO_PATH}/halo_common_lib.sh ] && . ${HALO_PATH}/halo_common_lib.sh

LOG_TAG="halo-metrics"

halo_log_info $LOG_TAG  "*** >>> Start to initialize halo-metrics  <<< ***"

if [ -s $MFG/authtoken ]; then
    setprop vendor.halo.authtoken $(cat $MFG/authtoken)
fi
if [ -s $MFG/serial ]; then
    setprop vendor.halo.serial $(cat $MFG/serial)
fi

[ -f /vendor/bin/maintainer ] && . /vendor/bin/maintainer
setprop vendor.halo.env $(echo ${POD} | grep -oE "^[[:alnum:]]+")
setprop vendor.halo.server $WORLD

halo_log_info $LOG_TAG  "*** >>> Finish initializing halo-metrics <<< ***"