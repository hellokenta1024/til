#!/bin/bash

logfile="/var/log/syslog"
start=$(date '+%s' -d "${1}")
end=$(date '+%s' -d "${2}")

while read mm dd tt line
do
  s=$(date -d "${mm} ${dd} ${tt}" "+%s")
  test ${start} -lt ${s} -a ${end} -ge ${s} && echo "${mm} ${dd} ${tt} ${line}"
done < ${logfile}