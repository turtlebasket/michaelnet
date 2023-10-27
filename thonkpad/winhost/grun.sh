#!/bin/bash

# Graphical runner for desktop

ISO=windows
DRIVENAME=winhost
MEM_GB=8

qemu-system-x86_64 -enable-kvm \
    -m $(expr 1024 \* $MEM_GB) -drive file=./$DRIVENAME.qcow2,format=qcow2 \
    -smp cores=2,threads=4 -vga virtio 

