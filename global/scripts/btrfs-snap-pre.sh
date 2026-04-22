#!/bin/bash
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
DATE=$(date +%Y-%m-%d_%H-%M)
SNAP_NAME="@_pre_pacman_$DATE"
SNAP_DEST="/.snapshots/$SNAP_NAME"
BOOT_ENTRY="/boot/loader/entries/arch-snap-$DATE.conf"

mkdir -p /.snapshots
btrfs subvolume snapshot -r / "$SNAP_DEST"

LATEST_CONF=$(ls -1 /boot/loader/entries/*linux-lts.conf | head -n 1)

LINUX_IMG=$(grep "^linux" "$LATEST_CONF")
INITRD_IMG=$(grep "^initrd" "$LATEST_CONF")
OPTIONS=$(grep "^options" "$LATEST_CONF" | sed "s|subvol=@|subvol=/@snapshots/$SNAP_NAME|")

cat <<EOF > "$BOOT_ENTRY"
title    Arch Linux (Snapshot: $DATE)
$LINUX_IMG
$INITRD_IMG
$OPTIONS
EOF

ls -1d /.snapshots/@_pre_pacman_* 2>/dev/null | head -n -5 | while read -r snap; do
    SNAP_DATE=$(echo "$snap" | sed 's/.*_pacman_//')
    rm -f "/boot/loader/entries/arch-snap-$SNAP_DATE.conf"
    btrfs subvolume delete "$snap"
done

