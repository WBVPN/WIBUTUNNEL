# WIBU TUNNELING v3.3 GACOR (Optimized)

**Multi-Protocol VPN Script** berbasis **Xray Core** + **HAProxy** dengan fitur lengkap untuk reseller/admin VPS.

## ✨ Fitur Utama

- **Multi Protocol**: VLESS, VMESS, Trojan (WS + gRPC + NTLS)
- **Limit System**: Limit IP + Limit Kuota (Real-time + Auto Lock)
- **Auto Lock**: Otomatis mengunci user yang melanggar limit
- **Smart Backup & Restore**: Via Telegram (File ID / Path / URL)
- **Traffic Monitor**: Real-time IP & Bandwidth monitoring
- **Auto Expire**: Hapus user otomatis + notifikasi Telegram
- **License System**: Proteksi script dengan IP + Expired date (**Centralized**)
- **Optimized**: Kernel tuning, QoS, Anti-Torrent, BBR

## 🔥 What's New in v3.3 GACOR

Versi ini sudah **fully optimized**:

- ✅ License check **terpusat** di `common.sh` (tidak ada duplikasi lagi)
- ✅ Semua menu script lebih bersih dan ringan
- ✅ Lebih mudah di-maintain
- ✅ Performa lebih baik

## 📦 Struktur Project

```
WIBUTUNNEL-main/
├── common.sh              # Library terpusat (License Check + Colors)
├── setup.sh               # Installer utama
├── config.json
├── haproxy.json
├── izin.txt
├── README.md
└── menu/
    ├── menu.sh
    ├── m-vless.sh
    ├── m-vmess.sh
    ├── m-trojan.sh
    ├── cek-trafik.sh
    ├── m-setting.sh
    ├── m-backup.sh
    ├── xp.sh
    ├── menu-lock.sh
    └── menu-unlock.sh
```

## 🚀 Instalasi

```bash
wget https://raw.githubusercontent.com/WBVPN/wibutunnel/main/setup.sh
chmod +x setup.sh
./setup.sh
```

## 📋 Menu Utama

| No | Menu                     |
|----|--------------------------|
| 1  | Kelola VLESS             |
| 2  | Kelola VMESS             |
| 3  | Kelola TROJAN            |
| 4  | Lock User                |
| 5  | Unlock User              |
| 6  | Cek Trafik & IP Monitor  |
| 7  | Setting Server           |
| 8  | Backup & Restore         |
| 0  | Exit                     |

## 📞 Support

- WhatsApp: **087757315408**
- Telegram: **t.me/wibuvpn**

---

**Developed by WIBU TUNNELING Team**  
**Versi: v3.3 GACOR Optimized** (June 2026)
