#!/bin/bash

docker run \
  --rm \
  -it -v $(dirname $(pwd)):/home/dbt/app \
  -v ~/.ssh/id_rsa:/home/dbt/.ssh/id_rsa \
  -v ~/.gitconfig:/home/.gitconfig \
  --network host \
  --env-file=../.properties \
  --env-file=../dev.properties \
  dbt-dev:0 "$@"