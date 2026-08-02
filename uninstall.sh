#!/bin/bash
# Script Uninstall WIBU TUNNELING

echo -e "\e[33mMemulai proses uninstall WIBU TUNNELING...\e[0m"

# Hentikan semua layanan
source /etc/wibutunnel/bot.conf 2>/dev/null
if [[ -n "$BOT_TOKEN" ]]; then
    curl -s "https://api.telegram.org/bot${BOT_TOKEN}/deleteWebhook" >/dev/null 2>&1
fi
systemctl stop xray haproxy wibutunnel-bot telegram-webhook.socket 2>/dev/null
systemctl disable xray haproxy wibutunnel-bot telegram-webhook.socket 2>/dev/null

# Hapus file konfigurasi dan database
rm -rf /usr/local/etc/xray /etc/haproxy /etc/wibutunnel /etc/xray /var/log/xray

# Hapus file executable menu & daemon
rm -rf /usr/local/sbin/algojo-* /usr/local/sbin/unlocker-wibu
rm -rf /usr/local/bin/menu* /usr/local/bin/m-* /usr/local/bin/lock-user /usr/local/bin/unlock-user /usr/local/bin/bot-daemon /usr/local/bin/bot-webhook /usr/local/bin/cek-trafik /usr/local/bin/watchdog.sh /usr/local/bin/renew-cert-wibu.sh /usr/local/bin/xp

# Bersihkan Cron Jobs bawaan Wibu Tunneling
crontab -l | grep -v 'watchdog.sh' | grep -v 'xp' | grep -v 'unlocker-wibu' | grep -v 'renew-cert-wibu.sh' | crontab -

# Hapus service systemd
rm -f /etc/systemd/system/xray.service /etc/systemd/system/telegram-webhook*
systemctl daemon-reload

# Bersihkan .profile
sed -i '/^clear$/d' /root/.profile
sed -i '/^menu$/d' /root/.profile

# Uninstall paket bawaan (opsional)
apt-get remove --purge -y haproxy vnstat jq >/dev/null 2>&1
apt-get autoremove -y >/dev/null 2>&1

echo -e "\e[32mUninstalasi Selesai! VPS sudah bersih dari WIBU TUNNELING.\e[0m"
