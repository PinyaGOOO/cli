#!/bin/bash
dnf remove -y git
nmcli con modify ens18 ipv6.method manual ipv6.addresses 2024:3::2/64
nmcli con modify ens18 ipv6.gateway 2024:3::1
nmcli con modify ens18 ipv4.method manual ipv4.addresses 3.3.3.2/30
nmcli con modify ens18 ipv4.gateway 3.3.3.1

nmcli con modify Проводное\ подключение\ 1 ipv6.method manual ipv6.addresses 2024:4::2/64
nmcli con modify Проводное\ подключение\ 1 ipv6.gateway 2024:4::1
nmcli con modify Проводное\ подключение\ 1 ipv4.method manual ipv4.addresses 4.4.4.2/30
nmcli con modify Проводное\ подключение\ 1 ipv4.gateway 4.4.4.1

systemctl restart NetworkManager

useradd -c "Admin" Admin -U
echo "Admin:P@ssw0rd" | chpasswd

hostnamectl set-hostname CLI; exec bash





