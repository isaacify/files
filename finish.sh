#!/bin/bash
if [ "$EUID" -ne 0 ] then
	echo "[!] Please run as root"
	exit
fi
pacman-key --init
pacman-key --populate archlinuxarm
pacman -R --noconfirm linux-aarch64 uboot-raspberrypi
pacman -Syu --noconfirm --overwrite "/boot/*" linux-rpi
reboot
