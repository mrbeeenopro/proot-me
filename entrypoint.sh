#!/bin/bash
cd /home/container

DISTRO_URL="https://cdimage.ubuntu.com/ubuntu-base/releases/22.04/release/ubuntu-base-20.04-base-amd64.tar.gz"

if [ ! -d "./rootfs" ]; then
    mkdir ./rootfs
    echo "--- Đang tải Distro về cho Pterodactyl... ---"
    curl -sSL $DISTRO_URL | tar -xzC ./rootfs
fi

echo "nameserver 8.8.8.8" > ./rootfs/etc/resolv.conf


exec proot -r ./rootfs -0 -w / -b /dev -b /proc -b /sys /usr/bin/env -i HOME=/root TERM=$TERM PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin /bin/bash
