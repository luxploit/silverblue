#!/bin/bash

if [ ! -f ./CMakeLists.txt ]; then
  echo "ABORT: You aren't running from the root directory, please change directory and try again."
  exit 1
fi

cmake -S . -B builds/cmake && cd builds/cmake && make