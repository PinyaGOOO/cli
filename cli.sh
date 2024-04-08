#!/bin/bash
nmcli con modify Проводное\ подключение\ 1 ipv6.method manual ipv6.addresses 2024:3::2/64
nmcli con modify Проводное\ подключение\ 1 ipv6.gateway 2024:3::1
nmcli con modify Проводное\ подключение\ 1 ipv4.method manual ipv4.addresses 3.3.3.2/30
nmcli con modify Проводное\ подключение\ 1 ipv4.gateway 3.3.3.1

nmcli con modify Проводное\ подключение\ 1 ipv6.method manual ipv6.addresses 2024:4::2/64
nmcli con modify Проводное\ подключение\ 1 ipv6.gateway 2024:4::1
nmcli con modify Проводное\ подключение\ 1 ipv4.method manual ipv4.addresses 4.4.4.2/30
nmcli con modify Проводное\ подключение\ 1 ipv4.gateway 4.4.4.1

hostnamectl set-hostname CLI; exec bash





