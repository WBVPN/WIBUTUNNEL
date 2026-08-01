#!/bin/bash
# Script Uninstall WIBU TUNNELING

echo -e "\e[33mMemulai proses uninstall WIBU TUNNELING...\e[0m"

# Hentikan semua layanan
systemctl stop xray haproxy wibutunnel-bot 2>/dev/null
systemctl disable xray haproxy wibutunnel-bot 2>/dev/null

# Hapus file konfigurasi dan database
rm -rf /usr/local/etc/xray /etc/haproxy /etc/wibutunnel /etc/xray /var/log/xray

# Hapus file executable menu & daemon
rm -rf /usr/local/sbin/algojo-* /usr/local/sbin/unlocker-wibu
rm -rf /usr/local/bin/menu* /usr/local/bin/m-* /usr/local/bin/lock-user /usr/local/bin/unlock-user /usr/local/bin/bot-daemon /usr/local/bin/cek-trafik

# Hapus service systemd
rm -f /etc/systemd/system/xray.service /etc/systemd/system/wibutunnel-bot.service
systemctl daemon-reload

# Uninstall paket bawaan (opsional)
apt-get remove --purge -y haproxy vnstat jq >/dev/null 2>&1
apt-get autoremove -y >/dev/null 2>&1

echo -e "\e[32mUninstalasi Selesai! VPS sudah bersih dari WIBU TUNNELING.\e[0m"
