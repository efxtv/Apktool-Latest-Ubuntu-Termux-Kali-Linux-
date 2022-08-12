# npm
Tutorial 

# L3mon without java8 NPM demo
<pre><code> source <(curl -fsSL https://raw.githubusercontent.com/efxtv/npm/main/L3mon-no-java8.sh) </code></pre>


Apktool chroot, Kali Linux, Ubuntu, etc
<pre><code>
curl -L -o $PWD/apktool https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool
curl -L -o $PWD/apktool.jar https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.6.1.jar
sudo chmod +x apktool*  
sudo mv apktool* /usr/bin/
</code></pre>

Apktool Termux
<pre><code>
pkg remove apktool
wget https://raw.githubusercontent.com/rendiix/rendiix.github.io/master/install-repo.sh
pkg update;pkg upgrade
pkg install zipalign 
</code></pre>

Fix outdated nodejs error <a href="https://heynode.com/tutorial/install-nodejs-locally-nvm/" target="_blank">Source</a>
<pre><code>
curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o install_nvm.sh
bash install_nvm.sh

export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install node
</code></pre>
