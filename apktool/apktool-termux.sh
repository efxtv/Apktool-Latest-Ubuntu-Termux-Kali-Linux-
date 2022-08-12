#!/bin/bash
pkg remove apktool
wget https://raw.githubusercontent.com/rendiix/rendiix.github.io/master/install-repo.sh
pkg update;pkg upgrade
pkg install zipalign
