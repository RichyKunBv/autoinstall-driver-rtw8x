# autoinstall-driver-rtw8x

<div align="center">

# Realtek Wi-Fi Driver Installer for Linux

![Shell Script](https://img.shields.io/badge/Language-Shell_Script-green?style=for-the-badge&logo=gnu-bash)
![Linux](https://img.shields.io/badge/OS-Linux-orange?style=for-the-badge&logo=linux)

A user-friendly script to automate the installation of popular Realtek Wi-Fi drivers on major Linux distributions.

</div>

---

This script simplifies the process of getting your Wi-Fi working by automatically detecting your OS, installing the necessary dependencies, and building the driver using DKMS.

> The main goal is to provide a reliable, single-step solution for installing drivers maintained by **lwfinger**, ensuring they persist across kernel updates.

---

## ✨ Features

* **Auto-Detection**: Automatically identifies the Linux distribution family (Debian, Fedora, or Arch).
* **Dependency Management**: Installs all required packages (`make`, `dkms`, `git`, headers, etc.) for you.
* **DKMS Integration**: Builds and installs the driver as a DKMS module, so it survives kernel upgrades.
* **Interactive Menu**: A simple and clean interface to choose the driver you want to install.

---

## 📦 Supported Drivers

Click on a driver below to see more details and the official repository link.

<details>
<summary>
  <strong>rtw88</strong> - For chipsets like RTL8822BE, RTL8822CE, etc.
</summary>
<br>
  <ul>
    <li>Common Chipsets: <code>RTL8821CE</code>, <code>RTL8822BE</code>, <code>RTL8822CE</code></li>
    <li><strong>Official Repository</strong>: <a href="https://github.com/lwfinger/rtw88">https://github.com/lwfinger/rtw88</a></li>
  </ul>
</details>

<details>
<summary>
  <strong>rtw89</strong> - For modern chipsets like RTL8852AE, RTL8852BE, etc.
</summary>
<br>
  <ul>
    <li>Common Chipsets: <code>RTL8852AE</code>, <code>RTL8852BE</code>, <code>RTL8852CE</code></li>
    <li><strong>Official Repository</strong>: <a href="https://github.com/lwfinger/rtw89">https://github.com/lwfinger/rtw89</a></li>
  </ul>
</details>

---

## 🚀 Getting Started

### Prerequisites

You need an active internet connection (e.g., via Ethernet or USB tethering) to download the script and the driver source code.

### Installation

1.  **Download the script and make it executable:**
    ```bash
    chmod +x autoinstall-beta-rt88.sh
    ```

2.  **Run the script with root privileges:**
    ```bash
    sudo ./autoinstall-beta-rt88.sh
    ```

3.  **Follow the on-screen instructions.**

---

## ⚠️ Important

> After the installation is complete, a system **reboot is highly recommended** to ensure the new kernel module loads correctly.
