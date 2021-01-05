#!/bin/bash

if [[ -n "$DB_DUMP_DEBUG" ]]; then
  set -x
fi

if [ -e ${DUMPFILE} ];
then
  echo "Started to push ${DUMPFILE}"
  file_name=$(basename ${DUMPFILE})
  rclone copy --progress --max-age 24h ${DUMPFILE} ${RCLONE_TARGET}
  if [[ -n "$DUMPFILE_DELETE" ]]; then
    rm ${DUMPFILE}
  fi
else
  echo "ERROR: Backup file ${DUMPFILE} does not exist!"
fi

