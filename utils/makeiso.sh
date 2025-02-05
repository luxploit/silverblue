#!/bin/bash

if [ ! -f ./CMakeLists.txt ]; then
  echo "ABORT: You aren't running from the root directory, please change directory and try again."
  exit 1
fi

rm -r builds/iso

mkdir -p builds/iso/boot/limine
mkdir -p builds/iso/EFI/BOOT

cp builds/bin/fentoskrnl builds/iso/boot
cp root/boot/limine/limine.conf builds/iso/boot/limine
cp 3rdparty/limine/limine-bios-cd.bin \
   3rdparty/limine/limine-uefi-cd.bin \
   3rdparty/limine/limine-bios.sys \
   builds/iso/boot/limine/
cp 3rdparty/limine/BOOTX64.EFI builds/iso/EFI/BOOT

xorriso -as mkisofs -R -r -J -b boot/limine/limine-bios-cd.bin \
        -no-emul-boot -boot-load-size 4 -boot-info-table -hfsplus \
        -apm-block-size 2048 --efi-boot boot/limine/limine-uefi-cd.bin \
        -efi-boot-part --efi-boot-image --protective-msdos-label \
        builds/iso -o builds/silverblue.iso

3rdparty/limine/limine bios-install builds/silverblue.iso