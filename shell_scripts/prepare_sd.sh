#!/bin/sh
#user u, password p
while getopts u:p: flag
do
    case "${flag}" in
        u) user=${OPTARG};;
        p) password=${OPTARG};;
    esac
done
# 1) todo: write image to sd card take path by var

# 2) create mount folder && mount boot partition of the raspios sd card to mnt
mkdir /mnt/raspios_boot
mount /dev/mmcblk0p1 /mnt/raspios_boot

# 3) enable ssh 
touch /mnt/raspios_boot/ssh

# 3.1) configure wifi
touch /mnt/raspios_boot/wpa_supplicant.conf

read -r -d '' WIFI <<EOF 
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=DE
network={
    scan_ssid=1
    ssid="Vodafone-A14C"
    psk="HalloWieGehtsDuPflaume!"
}
EOF

echo "$WIFI" > /mnt/raspios_boot/wpa_supplicant.conf

# 4) copy userconf to sd card -> create encrypted password with $ echo 'deinpasswort' | openssl passwd -6 -stdin
touch /mnt/raspios_boot/userconf
PASS=$(echo $password | openssl passwd -6 -stdin) 

echo "pide:$PASS" > /mnt/raspios_boot/userconf

# 5) unmount sd card and remove mount folder
umount /mnt/raspios_boot
rm -r /mnt/raspios_boot

# cat /home/reinhard/raspios.^Cg > /dev/mmcblk0 && mount /dev/mmcblk0p1 /mnt/ && touch /mnt/ssh && cp /root/userconf /mnt/ && umount /mnt
#root@tuxedo3:~# cat /root/userconf
#pi:$6$GYKoACQvQlIaAu7p$Z4LKRvBgwKreyo0leaTHjKOd//GxwDDBKeTsrGMWhkqS49k.9xrC4Zp4/Vit3aI0zOSjshWUDUAEo19Fi6s1b1