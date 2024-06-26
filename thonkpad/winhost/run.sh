#!/bin/bash

# Headless runner

ISO=windows
DRIVENAME=winhost
MEM_GB=8

qemu-system-x86_64 -accel kvm \
    -m $(expr 1024 \* $MEM_GB) -drive file=./$DRIVENAME.qcow2,format=qcow2 \
    -smp cores=2,threads=4 -nographic

