#!/bin/bash
dnf remove -y git
nmcli con modify ens18 ipv4.method manual ipv4.addresses 3.3.3.2/30
nmcli con modify ens18 ipv4.gateway 3.3.3.1

nmcli con modify Проводное\ подключение\ 1 ipv4.method manual ipv4.addresses 4.4.4.2/30
nmcli con modify Проводное\ подключение\ 1 ipv4.gateway 4.4.4.1 ipv4.dns 172.16.100.2 ipv4.dns-search hq.work + ipv4.routes 172.16.100.2/26 4.4.4.1

systemctl restart NetworkManager

useradd -c "Admin" Admin -U
echo "Admin:P@ssw0rd" | chpasswd

hostnamectl set-hostname CLI; exec bash





