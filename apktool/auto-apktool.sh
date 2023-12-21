#!/bin/bash
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
IGreen='\033[0;92m'
Yellow='\033[0;33m'
IYellow='\033[0;93m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
White='\033[0;37m'
clear='\033[0m'

ctermuxorlinux=$(which bash|grep -o termux)
if [ "$ctermuxorlinux" == "termux" ]; then
echo -e "\t${IGreen} ${clear} ${Green}Termux Found...${clear}"
rm $PREFIX/bin/apktool* 1>/dev/null
wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O $PREFIX/bin/apktool -q --show-progress
wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.9.0.jar -O $PREFIX/bin/apktool.jar -q --show-progress
chmod +x $PREFIX/bin/apktool*
else
echo -e "\t${IGreen} ${clear} ${Green}OS with Root found...${clear}"
sudo rm /usr/bin/apktool* 1>/dev/null
sudo wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O /usr/bin/apktool -q --show-progress
sudo wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.9.0.jar -O /usr/bin/apktool.jar -q --show-progress
sudo chmod +x /usr/bin/apktool*
fi 
