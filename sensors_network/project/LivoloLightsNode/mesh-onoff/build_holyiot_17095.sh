#!/usr/bin/env bash

export ZEPHYR_BASE=${HOME}/Work/zephyrproject/zephyr

if [[ "${1}null" == "null" ]]; then
  echo "Please provide prj conf file!"
  exit 1
fi

west build --pristine -b holyiot_17095 -- -DBOARD_DIR=./boards/arm/holyiot_17095 -DCONF_FILE="$1"
