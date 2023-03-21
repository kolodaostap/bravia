#!/sbin/sh

setenforce 0

# Get your device's block path where "system", "recovery", etc. lives.
# That can be "/dev/block/bootdevice/by-name" or something like that.

mkdir -p /dev/block/platform/soc/mtk-msdc.0/by-name/
busybox mount -o bind /dev/block/platform/soc/f006d000.MSDC0/by-name /dev/block/platform/soc/mtk-msdc.0/by-name/

