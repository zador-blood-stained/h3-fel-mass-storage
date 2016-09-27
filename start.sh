#!/bin/bash

echo "Connect device in FEL mode and press <Enter>"
read

BOARD=h3

sunxi-fel -p uboot $BOARD/u-boot-sunxi-with-spl.bin write 0x42000000 $BOARD/zImage write 0x43000000 $BOARD/script.bin write 0x43300000 $BOARD/uInitrd write 0x43100000 $BOARD/boot.scr
read
