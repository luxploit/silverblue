#!/bin/bash

if [ ! -f ./CMakeLists.txt ]; then
  echo "ABORT: You aren't running from the root directory, please change directory and try again."
  exit 1
fi

echo "resolving dependencies via package manager"
if [ -x "$(command -v apt)" ]; then
    if [ ! -f /etc/version ]; then # fuck ubuntu
        sudo apt install -y nasm clang lld binutils qemu-system qemu-system-x86 xorriso cmake
    fi
else
    echo "ABORT: We currently only support building silverblue on Debian 12 (Bookworm)!"
    exit 1
fi

echo "installing and configuring limine binaries for builds"
mkdir -p 3rdparty && cd 3rdparty && git clone https://github.com/limine-bootloader/limine.git --branch=v8.x-binary --depth=1 && cd limine && make