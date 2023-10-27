#!/bin/bash

# Boots into windows setup

ISO=windows
DRIVENAME=winhost
DRIVE_GB=80
MEM_GB=4

if [ -f $ISO.iso ]; then
    echo "Found $ISO.iso"
else
    echo "Access Windows download at"
    echo "https://www.microsoft.com/en-us/software-download/windows10ISO?4cd9df4f-deef-4431-9497-a04303f34986=True"
    echo ""
    echo "Paste authorized download URL: "

    read DL_LINK
    wget -O $ISO.iso $DL_LINK
fi

if [ -f $DRIVENAME.qcow2 ]; then
    echo "Found $DRIVENAME.qcow2."
else
    qemu-img create -f qcow2 $DRIVENAME.qcow2 ${DRIVE_GB}G
fi

# qemu-system-x86_64 -enable-kvm -display curses -nographic -cdrom $ISO.iso \
#     -m $(expr 1024 \* $MEM_GB) -drive file=./$DRIVENAME.qcow2,format=qcow2

qemu-system-x86_64 -enable-kvm -cdrom $ISO.iso -drive file=./$DRIVENAME.qcow2,format=qcow2 \
    -m $(expr 1024 \* $MEM_GB) -smp cores=2,threads=4 \
    -boot order=dc -vga virtio 

