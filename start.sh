#!/bin/bash

echo "Connect device in FEL mode and press <Enter>"
read

FEL=sunxi-fel
BOARD=$1


function exec-fel-command () {
    $FEL $@
    if [[ $? -ne 0 ]];then
        echo "Failed to exec: $FEL $@"
        exit 1
    fi
}

function boot-h3 () {
    exec-fel-command -p uboot h3/u-boot-sunxi-with-spl.bin write 0x42000000 h3/zImage write 0x43000000 h3/script.bin write 0x43300000 h3/uInitrd write 0x43100000 h3/boot.scr
}

function boot-h5 () {
    DTB_FILE="sun50i-h5-opi-zero-plus2.dtb"

    exec-fel-command -v -p spl h5/sunxi-spl.bin
    exec-fel-command -v -p write 0x44000 h5/bl31.bin
    exec-fel-command -v -p write 0x4a000000 h5/u-boot.bin
    exec-fel-command -v -p write 0x50000000 h5/Image
    exec-fel-command -v -p write 0x52000000 h5/dtb/$DTB_FILE
    exec-fel-command -v -p write 0x53000000 h5/uInitrd
    exec-fel-command -v -p write 0x43100000 h5/boot.scr
    exec-fel-command -v -p reset64 0x44000
}

if [[ $BOARD == "h3" ]];then
    boot-h3
elif [[ $BOARD == "h5" ]];then
    boot-h5
else
    echo "$0 board[h3|h5]"
    exit 1
fi
