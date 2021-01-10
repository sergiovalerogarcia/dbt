#!/bin/bash

function USAGE() {
  echo "USAGE: $0 <sbx|prd> <NAME> <VERSION> <COMMAND>" &> /dev/stderr
  exit 1
}

if [[ "$#" -lt 3 ]]; then
  USAGE
fi

ENV=$1
NAME=$2
VERSION=$3
COMMAND=$4

if [[ "sbx" != ${ENV} && "prd" != ${ENV} ]]; then
  USAGE
fi

docker run \
  --rm \
  --network host \
  --env-file=../.properties \
  --env-file=../${ENV}.properties \
  ${NAME}-dbt-${ENV}:${VERSION} ${COMMAND}