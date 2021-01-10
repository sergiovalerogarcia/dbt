#!/bin/bash

docker build .. -f dev.dockerfile \
  --network=host \
  -t dbt-dev:0