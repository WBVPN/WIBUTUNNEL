# CARA DEPLOY / INSTALL WIBUTUNNEL

Script ini digunakan untuk menginstal Autoscrit WIBU TUNNEL pada VPS Linux (Ubuntu/Debian).

## 👨‍💻 1. INSTALL MANUAL (Oleh User)
Jika Bos ingin menginstal script ini ke VPS baru secara manual:
1. Login ke VPS menggunakan akses `root`.
2. Jalankan perintah instalasi online dari Github (sangat disarankan agar selalu up-to-date):
   `apt update && apt install -y wget && wget -qO- https://raw.githubusercontent.com/WBVPN/WIBUTUNNEL/main/setup.sh | bash`
3. Ikuti proses instalasi di layar hingga selesai.

## 🤖 2. DEPLOY OLEH AI (By AI)
Jika AI diminta untuk menginstal dari file lokal ini:
1. Pastikan file `setup.sh` sudah memiliki izin eksekusi (`chmod +x setup.sh`).
2. Jalankan skrip setup secara langsung menggunakan perintah:
   `bash setup.sh`
3. (Peringatan: Jika VPS ini sudah pernah terinstal WibuTunnel sebelumnya, instalasi ulang mungkin akan menimpa konfigurasi yang ada).
