# Preparations

## Linux and OS X

- compile and install [sunxi-tools](https://github.com/linux-sunxi/sunxi-tools)

- (optional) add udev rule to allow access to USB devices to users belonging to (previously created) "sunxi-fel" group:

```
SUBSYSTEMS=="usb", ATTR{idVendor}=="1f3a", ATTR{idProduct}=="efe8", GROUP="sunxi-fel"
```

## Windows

- download [Zadig](http://zadig.akeo.ie/)

- connect board in FEL mode to your PC

- launch "Zadig"

- check "Options\List all devices"

- select device with VID=`1F3A` and PID=`EFE8` (i.e. `USB Device(VID_1f3a_PID_efe8)`)

- install "WinUSB" driver (tested on Win8.1 x86)


# Notes

If eMMC is not detected, SD card will be exported instead

Some boards (like [Orange Pi PC Plus](https://linux-sunxi.org/Orange_Pi_PC#Orange_Pi_PC_Plus)) which don't have FEL button require using special SD image to [enter FEL mode](https://linux-sunxi.org/FEL#Entering_FEL_mode):

Use `dd`, `Rufus` or `Etcher` to flash fel-sdboot.img to SD card like any OS image and use this card to boot the board in FEL mode.
