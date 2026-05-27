# TWRP device tree for Lenovo Smart Tab M10 HD (TB-X505F)


# Features
Everything is working, including:

- FBEv1 decryption (with support for Android 12+ ROMs)
- MTP
- USB OTG
### About Device

![Lenovo Smart Tab M10 HD](https://static.lenovo.com/ww/campaigns/2019/smarttab/lenovo-smart-tab-gallery-5.jpg "Lenovo Smart Tab M10 HD (TB-X505F)")


================================================================
Component   | Specs
-------:|:-------------------------
Chipset| Qualcomm Snapdragon 429 (SDM429)
CPU | ARM Cortex-A53, Quad-Core, 2.0 GHz
GPU     | Qualcomm Adreno 504, 650 MHz
Memory  | 2/3 GB (soldered)
Shipped Android Version | 8.0 (Oreo), upgrade to 10.0 (Q)
Storage | 32 GB (eMMC)
MicroSD | Up to 256 GB
Battery | 4850 mAh, Li-Po (non-removable)
Display | 1280x800 pixels, 10.1"
Front Camera | 2.0 MP, fixed focus
Rear Camera  | 5.0 MP, auto focus
WiFi | dual band, 802.11a/ac/b/g/n
Bluetooth | v4.2
USB | microUSB
Release Date | April 2019


To build:

```
. build/envsetup.sh
lunch twrp_X505X-eng
mka recoveryimage
```

Note: You have to apply the patch in "patches" folder to the TWRP source (bootable/recovery directory) before building to fix battery percentage indicator.
