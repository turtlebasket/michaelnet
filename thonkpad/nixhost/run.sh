#!/bin/bash

DRIVENAME=nixhost
MEM_GB=1
SSH_PORT=2022

qemu-system-x86_64 -enable-kvm -nographic -vga none \
	-net user,hostfwd=tcp::2022-:22 -net nic \
    -m $(expr 1024 \* $MEM_GB) -drive file=./$DRIVENAME.qcow2,format=qcow2 

