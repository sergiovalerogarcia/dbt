#!/bin/bash

function USAGE() {
  echo "USAGE: $0 <dev|sbx|prd> <NAME> <VERSION> [DIR_GIT_SSH_ID_RSA](only dev mode) <COMMAND>" &> /dev/stderr
  exit 1
}

if [[ "$#" -lt 3 ]]; then
  USAGE
fi

ENV=$1
NAME=$2
VERSION=$3

if [[ "dev" != ${ENV} && "sbx" != ${ENV} && "prd" != ${ENV} ]]; then
  USAGE
fi

IT_AND_MOUNT_VOLUME_DEV_MODE=""
COMMAND=""
if [[ ${ENV} ==  "dev" ]]; then
  COMMAND=$4
  IT_AND_MOUNT_VOLUME_DEV_MODE="-it -v $(dirname $(pwd)):/home/dbt/app"
  if [[ -n "$5" ]]; then
    DIR_GIT_SSH_ID_RSA=$4
    COMMAND=$5
    IT_AND_MOUNT_VOLUME_DEV_MODE=" ${IT_AND_MOUNT_VOLUME_DEV_MODE} -v ${DIR_GIT_SSH_ID_RSA}:/home/dbt/.ssh/id_rsa"
  fi
  else 
    COMMAND=$4
fi

docker run \
  --rm \
  ${IT_AND_MOUNT_VOLUME_DEV_MODE} \
  --network host \
  --env-file=../.properties \
  --env-file=../${ENV}.properties \
  ${NAME}-dbt-${ENV}:${VERSION} ${COMMAND}