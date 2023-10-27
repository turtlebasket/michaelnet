#!/bin/bash

# Graphical runner for desktop

DRIVENAME=nixhost
MEM_GB=1

qemu-system-x86_64 -enable-kvm \
    -m $(expr 1024 \* $MEM_GB) -drive file=./$DRIVENAME.qcow2,format=qcow2 

