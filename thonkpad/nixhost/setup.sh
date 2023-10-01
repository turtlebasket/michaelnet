#!/bin/bash

ISO=nixos
DRIVENAME=nixhost
DRIVE_GB=50
MEM_GB=1

if [ -f $ISO.iso ]; then
    echo "Found $ISO.iso"
else
    wget -O $ISO.iso https://channels.nixos.org/nixos-23.05/latest-nixos-minimal-x86_64-linux.iso
fi

if [ -f $DRIVENAME.qcow2 ]; then
    echo "Found $DRIVENAME.qcow2."
else
    qemu-img create -f qcow2 $DRIVENAME.qcow2 ${DRIVE_GB}G
fi

# try headless-esque flags:
# -display curses
# -nographic

qemu-system-x86_64 -enable-kvm -display curses -nographic -cdrom $ISO.iso \
    -m $(expr 1024 \* $MEM_GB) -drive file=./$DRIVENAME.qcow2,format=qcow2

