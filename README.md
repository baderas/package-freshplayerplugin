# package-freshplayerplugin

This script packages Freshplayerplugin for Debian<br />
Tested with Freshplayerplugin version 0.3.1 on Debian Jessie

Warning: This script worked for me but is kind of raw and unpolished. Use at your own risk!

**Thx to:**<br />
i-rinat <ibragimovrinat@mail.ru> for Freshplayerplugin<br />
https://github.com/i-rinat/freshplayerplugin<br />
webupd8 for Control file<br />
http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/f/freshplayerplugin/<br />
Debian Wiki<br />
https://wiki.debian.org/Freshplayerplugin<br />

**Build-deps:**<br />
build-essential git cmake pkg-config libglib2.0-dev libasound2-dev libx11-dev libgl1-mesa-dev liburiparser-dev libcairo2-dev libpango1.0-dev libpangocairo-1.0-0 libpangoft2-1.0-0 libfreetype6-dev libgtk2.0-dev libxinerama-dev libconfig-dev libevent-dev libegl1-mesa-dev libgles2-mesa-dev ragel libssl-dev libv4l-dev libavcodec-dev libavutil-dev libva-dev libva-x11-1 libvdpau-dev

**Optional build-deps:**<br />
libpulse-dev libjack-dev

**Usage (example):**<br />
cd /tmp<br />
git clone https://github.com/baderas/package-freshplayerplugin.git<br />
cd package-freshplayerplugin<br />
./package_freshplayerplugin.sh<br />
sudo dpkg -i freshplayerplugin-0.3.1-amd64.deb<br />
sudo apt-get install -f<br />
