#!/bin/bash
sudo rm /usr/bin/apktool* 1>/dev/null
sudo wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O /usr/bin/apktool -q --show-progress
sudo wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.9.0.jar -O /usr/bin/apktool.jar -q --show-progress
sudo chmod +x /usr/bin/apktool*

