# 🦋 WIBU TUNNELING v4.0 Kurumi 🦋

[![Version](https://img.shields.io/badge/Version-v4.0_Kurumi-blue.svg?style=for-the-badge&logo=appveyor)](https://github.com/WBVPN/wibutunnel)
[![Platform](https://img.shields.io/badge/Platform-Ubuntu%20%7C%20Debian-green.svg?style=for-the-badge&logo=ubuntu)](https://github.com/WBVPN/wibutunnel)
[![Status](https://img.shields.io/badge/Status-Stable%20%26%20Ultimate-success.svg?style=for-the-badge&logo=checkmarx)](https://github.com/WBVPN/wibutunnel)

**Ultimate Xray VPN Auto Script** dengan arsitektur paling ringan dan mutakhir. Dibangun khusus untuk memberikan performa maksimal pada VPS dengan perlindungan keamanan, manajemen memori tingkat lanjut, dan sistem limit otomatis (Algojo). Edisi spesial **Kurumi** 💜.

---

## ✨ Fitur Unggulan (What's New in v4.0 Kurumi)

🚀 **100% Zero Disk I/O (RAM Disk Logging)**
Tidak ada lagi HDD/SSD yang rusak! Seluruh aktivitas *log* koneksi Xray kini diproses murni di atas awan (RAM / `tmpfs`), menjadikan VPS **Super Snappy** dan kebal terhadap antrean baca-tulis (I/O Wait).

🧠 **Otak Algojo Generasi Baru (Awk Engine V4 + Tac Optimization)**
Sistem auto-kill (Algojo) kini menggunakan teknik pembacaan log terbalik (`tac`) yang dikombinasikan dengan *Early Exit* pada AWK. Walaupun VPS diserbu ribuan user aktif bersamaan, Algojo sanggup menangkap setiap pelanggaran multilogin 100% akurat dalam sekejap tanpa limitasi baris log! Keamanan ditingkatkan dengan penambalan celah *Command Injection* (JSON).

🛡️ **Anti URL-Encoding (100% Koneksi Sukses)**
Frontend HAProxy kini kebal terhadap eror akibat *copy-paste* link klien (seperti spasi atau karakter `%2F`). Apapun linknya, routing akan selalu sampai ke *backend* tanpa error 503.

🔄 **Sistem Recovery Cerdas**
Klien yang limit atau expired **TIDAK AKAN DIHAPUS**. Mereka otomatis dimasukkan ke "Ruang Recovery" (Akses Diblokir). Saat klien memperpanjang sewa, fitur **Unlock** memungkinkan klien langsung konek tanpa perlu repot ganti link di aplikasinya!

🤖 **Bot Telegram Super Admin**
Tidak perlu repot buka aplikasi SSH/Termius! Bos bisa Create, Renew, Hapus, Lock, Cek Trafik, dan Cek Real-time Login langsung dari *chat* Telegram dengan *layout* premium nan elegan.

🚫 **Auto IPv6 Disabler**
Sudah terintegrasi fitur pemusnah IPv6 di inti OS (via sysctl & GRUB). VPS yang baru diinstal dijamin **kebal dari error `apt update`** dan masalah *routing* Xray yang disebabkan oleh konflik IPv6!

---

## 📦 Protokol yang Didukung
- **VLESS** (WS TLS, WS Non-TLS, gRPC)
- **VMESS** (WS TLS, WS Non-TLS, gRPC)
- **TROJAN** (WS TLS, gRPC)

---

## ⚡ Instalasi Cepat (1-Click Install)

Cukup *copy-paste* perintah berikut di terminal VPS (Ubuntu/Debian) Anda yang masih **FRESH** (Baru di-Rebuild):

```bash
apt update -y && apt install -y curl wget && bash <(curl -s https://ghproxy.net/https://raw.githubusercontent.com/WBVPN/wibutunnel/main/setup.sh)
```

---

## 📋 Daftar Menu

| Menu Utama | Sub-Fitur |
| :--- | :--- |
| **Kelola VLESS** | Create, Delete, Renew, Trial, Cek Kuota |
| **Kelola VMESS** | Create, Delete, Renew, Trial, Cek Kuota |
| **Kelola TROJAN** | Create, Delete, Renew, Trial, Cek Kuota |
| **Recovery Center** | Lock Akun, Unlock Akun, Hapus Permanen |
| **Cek Trafik** | Monitor Real-Time IP dan Bandwidth |
| **Sistem Panel** | Backup & Restore via Telegram (File ID / Path) |

---

## 🤖 Cara Mengaktifkan Bot Telegram

Setelah proses instalasi di VPS selesai, fitur Bot Telegram belum langsung menyala karena membutuhkan Token milik Anda. 

1. Buka Telegram dan cari **@BotFather**, lalu buat bot baru dengan mengetik `/newbot`.
2. Dapatkan **HTTP API Token** dari BotFather.
3. Dapatkan **CHAT ID** Telegram Anda (bisa melalui bot @userinfobot atau @MissRose_bot).
4. Masuk ke terminal VPS Anda, ketik `menu`.
5. Pilih **[6] Pengaturan / Settings**, lalu pilih **Setup Bot Telegram**.
6. Masukkan Token dan Chat ID Anda. Bot siap melayani Anda 24/7!

---

## 🗑️ Cara Uninstall Script (Hapus Bersih)

Jika Anda ingin menghapus WIBU TUNNELING secara menyeluruh dari VPS Anda tanpa harus *rebuild* OS, jalankan blok perintah berikut di terminal:

```bash
bash <(curl -s https://ghproxy.net/https://raw.githubusercontent.com/WBVPN/wibutunnel/main/uninstall.sh)
```

---

## 📞 Support & Kontak

- **WhatsApp** : [087757315408](https://wa.me/6287757315408)
- **Telegram** : [t.me/wibuvpn](https://t.me/wibuvpn)

> **Developed by WIBU TUNNELING Team**  
> **Versi:** v4.0 Kurumi (2026)
