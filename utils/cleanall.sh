#!/bin/bash

if [ ! -f ./CMakeLists.txt ]; then
  echo "ABORT: You aren't running from the root directory, please change directory and try again."
  exit 1
fi

source utils/clean.sh
source utils/clean_vendor.sh