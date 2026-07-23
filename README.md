<div align="center">

# 🦋 WIBU TUNNELING v4.0 KURUMI (FINAL PERFECT)

**The Ultimate Xray VPN Auto Script**  
*Arsitektur Paling Ringan, Aman, dan Mutakhir untuk VPS Anda.*

[![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](#)
[![Xray-core](https://img.shields.io/badge/Core-Xray_1.8.x-blue?style=for-the-badge)](#)
[![OS](https://img.shields.io/badge/OS-Ubuntu%20%7C%20Debian-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](#)
[![Security](https://img.shields.io/badge/Security-Enterprise_Grade-red?style=for-the-badge&logo=shield&logoColor=white)](#)

</div>

---

## 🌟 Apa Itu Wibu Tunneling?

**Wibu Tunneling** adalah *Auto Script* premium yang diciptakan khusus untuk membangun server VPN berkinerja ekstrim. Dirombak ulang pada versi 4.0 dengan perlindungan keamanan tingkat tinggi (Enterprise-Grade Security), manajemen memori *(RAM Disk Logging)* yang inovatif, serta sistem pemblokiran otomatis (Algojo) super cepat.

---

## ✨ Fitur Unggulan (What's New in v4.0)

<details>
<summary><b>🔥 Klik untuk melihat daftar fitur utama!</b></summary>

### 1. 🚀 100% Zero Disk I/O (RAM Disk Logging)
Selamat tinggal `I/O Wait` dan SSD cepat aus! Seluruh aktivitas *log* koneksi Xray diproses sepenuhnya secara virtual di atas RAM (`tmpfs`), menjadikan respon VPS super kilat.

### 2. 🧠 Otak Algojo Generasi Baru (Awk Engine)
Skrip pengawas *Limit IP* dan Kuota beroperasi menggunakan modul `awk` tingkat rendah. Dapat membedah puluhan ribu *log* dalam **1 milidetik** tanpa mengonsumsi CPU sama sekali. Akurasi pemblokiran terjamin!

### 3. 🛡️ Keamanan & Stabilitas Tingkat Dewa (NEW PATCH!)
- **Anti-Command Injection:** Seluruh manipulasi data Xray kini menggunakan fungsi *safe-guard* JSON (mengamankan VPS dari input *user* berbahaya).
- **Anti-Race Condition:** Penggunaan teknologi `mktemp` memastikan *config* Anda aman dari kerusakan saat banyak *user* dieksekusi secara bersamaan.
- **Smart Fallback Download:** Pemasangan aman dari pemblokiran ISP menggunakan sistem *multi-layer routing* (GitHub Raw ➜ GHProxy ➜ JSDelivr CDN).
- **Encrypted Backup:** File *backup* kini dilindungi secara otomatis menggunakan kunci *hash* MD5 unik.

### 4. 🔄 Sistem Recovery Cerdas (Lock / Unlock)
Klien yang melebihi batas atau kedaluwarsa **TIDAK DIHAPUS**, melainkan dimasukkan ke "Ruang Isolasi" (Akses Diblokir). Saat klien memperpanjang sewa, fitur **Unlock** langsung menghubungkan mereka tanpa harus repot mengganti link di aplikasi klien.

### 5. 🤖 Bot Telegram Super Admin (DRY Architecture)
Kendalikan VPS Anda cukup dari kasur! Tersedia *layout* HTML elegan pada Telegram untuk Create, Renew, Hapus, Lock, Cek Trafik, hingga Cek *Real-time Login* (*Anti-Limit Telegram Bypass*).

### 6. 🚫 Auto IPv6 Disabler
Kebal dari *error* `apt update` atau lambatnya *routing* Xray yang sering diakibatkan oleh konflik IPv6 internal Linux.

</details>

---

## 📦 Protokol Dukungan Xray
| Protokol | Transport | Keamanan |
| :--- | :--- | :--- |
| **VLESS** | WS, gRPC | TLS, Non-TLS |
| **VMESS** | WS, gRPC | TLS, Non-TLS |
| **TROJAN** | WS, gRPC | TLS |

---

## ⚡ Instalasi Cepat (1-Click Install)

Siapkan VPS **Ubuntu (20.04/22.04)** atau **Debian (10/11)** yang masih baru (Fresh Rebuild), *login* sebagai root, dan eksekusi perintah sakti ini:

```bash
apt update -y && apt install -y curl wget && bash <(curl -s https://raw.githubusercontent.com/WBVPN/WIBUTUNNEL/main/setup.sh)
```

> **Waktu instalasi rata-rata:** ~3 Menit!

---

## 📋 Daftar Menu CLI

Ketika Anda mengetik perintah `menu` di Terminal VPS, Anda akan disambut dengan UI cantik yang berisi:

1. **Kelola VLESS** *(Create, Delete, Renew, Trial, Detail)*
2. **Kelola VMESS** *(Create, Delete, Renew, Trial, Detail)*
3. **Kelola TROJAN** *(Create, Delete, Renew, Trial, Detail)*
4. **Recovery Center** *(Lock Akun, Unlock Akun, Hapus Permanen)*
5. **Monitor Trafik** *(Live Monitor IP & Top Usage Kuota)*
6. **Sistem Panel / Settings** *(Backup, Restore, Setup Bot Telegram, Restart)*

---

## 🤖 Menghubungkan Bot Telegram

Instalasi selesai? Bot Telegram belum menyala sebelum Anda mengaitkannya dengan akun Telegram Anda:

1. Buka Telegram ➜ Cari **@BotFather** ➜ Ketik `/newbot` untuk membuat bot baru.
2. Salin **HTTP API Token** yang diberikan oleh BotFather.
3. Ketahui **CHAT ID** Telegram Anda (gunakan bot seperti `@userinfobot`).
4. Buka terminal VPS, ketik `menu`.
5. Masuk ke **[6] Pengaturan / Settings** ➜ Pilih **Setup Bot Telegram**.
6. Tempelkan *Token* dan *Chat ID* Anda.
7. **Selesai!** Ketik `/menu` atau `/start` di chat Bot Anda.

---

## 📞 Dukungan & Kontak

Ada pertanyaan, butuh kustomisasi panel, atau pembelian lisensi VIP? 
Silakan ketuk pintu kami di bawah ini:

- 💬 **WhatsApp:** [087757315408](https://wa.me/6287757315408)
- ✈️ **Telegram:** [t.me/wibuvpn](https://t.me/wibuvpn)

<br/>

<div align="center">
  <b>Made with ❤️ by WIBU TUNNELING Team</b><br/>
  <i>Versi v4.0 KURUMI (Juli 2026)</i>
</div>
