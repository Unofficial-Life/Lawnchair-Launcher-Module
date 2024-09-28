# Systemless Lawnchair Launcher (Unofficial)

[![GitHub release](https://img.shields.io/github/release/Unofficial-Life/Lawnchair-Launcher-Module.svg)](https://github.com/Unofficial-Life/Lawnchair-Launcher-Module/releases) &nbsp;
![Repo visits](https://visitcount.itsvg.in/api?id=Lawnchair-Launcher-Module&label=Repo%20views%20&color=0&icon=5&pretty=false)

> **Note**: This is an unofficial module. Do **not** request support in official Lawnchair channels, as doing so could result in a ban or kick from their community.

---

## 📑 Table of Contents
1. [Module Features](#-module-features)
2. [Important: Before Flashing ⚠️](#%EF%B8%8F-important-before-flashing)
3. [Installation](#-installation)
4. [Updating the Module Yourself](#-updating-the-module-yourself)
5. [Optional: Removing Lawnicons](#-optional-removing-lawnicons)
6. [Special Thanks](#-special-thanks-to)

---

## 🌟 Module Features
- Systemless installation of Lawnchair Launcher via Magisk or KernelSU.
- Supports Android versions 10 (Q) to 14 (QPR3).
- **Quickswitch Integration**: Replaces Recents Provider without extra configuration.
- Automatic updates via Magisk/KSU.

---

## ⚠️ Important: Before Flashing
- **Magisk Users:** Ensure "Enforce DenyList" is turned off.
- **KSU Users:** Disable the "Unmount module by default" toggle.

---

## 📦 Installation

1. Download the zip file from the [Latest Release](https://github.com/Unofficial-Life/Lawnchair-Launcher-Module/releases/latest).
2. Flash the zip in Magisk or KernelSU.
3. Reboot and enjoy the Lawnchair experience!

---

## 🔄 Updating the Module Yourself

To manually update or customize the module:

1. **Download the repository** as a [zip file](https://github.com/Unofficial-Life/Lawnchair-Launcher-Module/archive/refs/heads/main.zip).
2. **Extract the files** from the zip.
3. **Edit `module.prop`:**
   - Remove the `update.json` line (to disable automatic updates from this repo).
4. **Clean up unnecessary files** such as `README.md`, `CHANGELOG.md`, and `.github` folder (optional but recommended).
5. **Download the latest Lawnchair APK** from the [Lawnchair Modded Repo](https://github.com/Unofficial-Life/Lawnchair-Modded) or another version of your choice.
6. **Rename the APK** to `Dev.apk` and place it in `System/priv-app/dev`.
7. **Zip the folder** containing all files.
8. **Flash the new zip** through Magisk or KSU.

---

## 🛠 Optional: Removing Lawnicons

If you do not want Lawnicons, simply delete the `lawnicons` folder from `System/priv-app` within the module zip before flashing.

---

## 💖 Special Thanks to

| Lawnchair Team | Amr Gamal ❥ | Kartrexofficial | Goooler | Mr Sluffy | Eren |
|:--------------:|:-----------:|:---------------:|:-------:|:---------:|:----:|
| [<img src="https://avatars.githubusercontent.com/u/34144436?s=200&v=4" width=115>](https://github.com/LawnchairLauncher)<br><sub>Lawnchair</sub> | [<img src="https://avatar.fuplink.net/avatar/dircover/6326959?verc=0823110339" width=115>](https://t.me/AMRGAMAL_STORE)<br><sub>Special Icons</sub> | [<img src="https://avatars.githubusercontent.com/u/172979966?v=4" width=115>](https://github.com/Kartrexofficial)<br><sub>&nbsp;</sub> | [<img src="https://avatars.githubusercontent.com/u/10363352?v=4" width=115>](https://github.com/Goooler)<br><sub>Lawnchair Fork</sub> | [<img src="https://avatars.githubusercontent.com/u/36076410?v=4" width=115>](https://github.com/MrSluffy)<br><sub>Module Script</sub> | [<img src="https://avatars.githubusercontent.com/u/101087324?v=4" width=115>](https://github.com/LinuxGuy312)<br><sub>Helper</sub> |
