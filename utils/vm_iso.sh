#!/bin/bash

if [ ! -f ./CMakeLists.txt ]; then
  echo "ABORT: You aren't running from the root directory, please change directory and try again."
  exit 1
fi

source utils/makeiso.sh
qemu-system-x86_64 -cdrom builds/silverblue.iso