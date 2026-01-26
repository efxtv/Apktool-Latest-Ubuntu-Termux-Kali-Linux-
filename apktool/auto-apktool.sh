#!/usr/bin/env bash
set -e

echo "[+] Detecting environment..."

# Detect Termux
if [ -n "$TERMUX_VERSION" ] || [[ "$PREFIX" == *"com.termux"* ]]; then
    echo "[+] Termux detected"
    echo "[+] Installing apktool"
    sleep 3
    apt update -y
    apt install apktool -y
    echo "[+] Apktool installed on Termux"
    exit 0
fi

# Detect Linux (Kali / Ubuntu / Debian / etc.)
if [ "$(uname -s)" = "Linux" ]; then
    echo "[+] Linux detected (Kali / Ubuntu / Debian)"

    echo "[+] Removing old apktool binaries..."
    sudo rm -f /usr/bin/apktool*
    sudo rm -f /usr/local/bin/apktool*

    echo "[+] Downloading apktool wrapper..."
    sudo wget -q --show-progress \
        https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool \
        -O /usr/local/bin/apktool

    echo "[+] Downloading apktool jar..."
    sudo wget -q --show-progress \
        https://github.com/iBotPeaches/Apktool/releases/download/v2.9.3/apktool_2.9.3.jar \
        -O /usr/local/bin/apktool.jar

    echo "[+] Setting permissions..."
    sudo chmod +x /usr/local/bin/apktool /usr/local/bin/apktool.jar

    echo "[+] Apktool installed successfully"
    exit 0
fi

echo "[E] Unsupported OS"
exit 0
