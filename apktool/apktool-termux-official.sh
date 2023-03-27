#!/bin/bash
curl -L -o $PWD/apktool https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool --progress-bar
curl -L -o $PWD/apktool.jar https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.7.0.jar --progress-bar
chmod +x $PREFIX/bin/apktool*  
