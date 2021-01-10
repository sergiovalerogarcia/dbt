#!/bin/bash

function USAGE() {
  echo "USAGE: $0 <dev|sbx|prd> <NAME> <VERSION>" &> /dev/stderr
  exit 1
}

if [[ "$#" -lt 3 ]]; then
  USAGE
fi

ENV="$1"
NAME="$2"
VERSION="$3"

if [[ "dev" != ${ENV} && "sbx" != ${ENV} && "prd" != ${ENV} ]]; then
  USAGE
fi

DOCKER_FILE="prd_sbx.dockerfile"
MOUNT_SECRET=""
BUILD_ARG=""
if [[ "sbx" != ${ENV} && "prd" != ${ENV} ]]; then
  DOCKER_FILE="dev.dockerfile"  
  BUILD_ARG="--build-arg DOCKER_USER=$(whoami)"
fi

docker build .. -f ${DOCKER_FILE}\
  --network=host \
  -t ${NAME}-dbt-${ENV}:${VERSION} \
  ${BUILD_ARG}