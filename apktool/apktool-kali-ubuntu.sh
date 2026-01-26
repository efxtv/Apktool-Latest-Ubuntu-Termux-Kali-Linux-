#!/bin/bash
sudo rm /usr/bin/apktool* 1>/dev/null
sudo rm /usr/local/bin/apktool* 1>/dev/null
sudo wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O /usr/local/bin/apktool -q --show-progress
sudo wget https://github.com/iBotPeaches/Apktool/releases/download/v2.9.3/apktool_2.9.3.jar -O /usr/local/bin/apktool.jar -q --show-progress
sudo chmod +x /usr/local/bin/apktool*

