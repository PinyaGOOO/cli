#!/bin/bash
dnf remove -y git
dnf install -y chrony
nmcli con modify ens18 ipv4.method manual ipv4.addresses 3.3.3.2/30
nmcli con modify ens18 ipv4.gateway 3.3.3.1

nmcli con modify Проводное\ подключение\ 1 ipv4.method manual ipv4.addresses 4.4.4.2/30
nmcli con modify Проводное\ подключение\ 1 ipv4.gateway 4.4.4.1 ipv4.dns 172.16.100.2 ipv4.dns-search hq.work 
nmcli con modify Проводное\ подключение\ 1 ipv4.routes "172.16.100.2/26 4.4.4.1" 
nmcli con modify Проводное\ подключение\ 1 +ipv4.routes "192.168.100.0/26 4.4.4.1"

systemctl restart NetworkManager

sed -i '3s/^/#/' /etc/chrony.conf
sed -i '4s/^/#/' /etc/chrony.conf
sed -i '5s/^/#/' /etc/chrony.conf
sed -i '6s/^/#/' /etc/chrony.conf
sed -i '7a\server 1.1.1.2 iburst prefer' /etc/chrony.conf

systemctl enable --now chronyd
systemctl restart chronyd
chronyc sources

useradd -c "Admin" Admin -U
echo "Admin:P@ssw0rd" | chpasswd

hostnamectl set-hostname CLI; exec bash





