#!/bin/bash

# This script packages Freshplayerplugin for Debian
# Tested with Freshplayerplugin version 0.3.1 on Debian Jessie

# Thx to i-rinat <ibragimovrinat@mail.ru> for Freshplayerplugin
# https://github.com/i-rinat/freshplayerplugin
# webupd8 for Control file
# http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/f/freshplayerplugin/
# Debian Wiki
# https://wiki.debian.org/Freshplayerplugin

# build-deps:
# build-essential git cmake pkg-config libglib2.0-dev libasound2-dev libx11-dev libgl1-mesa-dev liburiparser-dev libcairo2-dev libpango1.0-dev libpangocairo-1.0-0 libpangoft2-1.0-0 libfreetype6-dev libgtk2.0-dev libxinerama-dev libconfig-dev libevent-dev libegl1-mesa-dev libgles2-mesa-dev ragel libssl-dev libv4l-dev libavcodec-dev libavutil-dev libva-dev libva-x11-1 libvdpau-dev
# optional build-deps:
# libpulse-dev libjack-dev

tmpdir="/tmp"
ver=0.3.1
arch="amd64"

pwd="$(pwd)"
cd "$tmpdir"

git clone https://github.com/i-rinat/freshplayerplugin.git
cd freshplayerplugin
git checkout tags/v$ver
mkdir build
cd build
cmake ..
make

mkdir -p "$tmpdir/freshplayerplugin/package/DEBIAN"
mkdir -p "$tmpdir/freshplayerplugin/package/usr/lib/mozilla/plugins/"
mv "$tmpdir/freshplayerplugin/build/libfreshwrapper-pepperflash.so" "$tmpdir/freshplayerplugin/package/usr/lib/mozilla/plugins/"
echo "Package: freshplayerplugin" >> "$tmpdir/freshplayerplugin/package/DEBIAN/control"
echo "Section: libs" >> "$tmpdir/freshplayerplugin/package/DEBIAN/control"
echo "Version: $ver" >> "$tmpdir/freshplayerplugin/package/DEBIAN/control"
echo "Maintainer: Andreas Bader <Development@Geekparadise.de>" >> "$tmpdir/freshplayerplugin/package/DEBIAN/control"
echo "Architecture: $arch" >> "$tmpdir/freshplayerplugin/package/DEBIAN/control"
echo "Depends: libasound2 (>= 1.0.18), libavcodec56 (>= 6:11~beta1) | libavcodec-extra-56 (>= 6:11.2), libavutil54 (>= 6:11~beta1), libc6 (>= 2.14), libcairo2 (>= 1.2.4), libconfig9, libevent-2.0-5 (>= 2.0.10-stable), libevent-pthreads-2.0-5 (>= 2.0.10-stable), libfreetype6 (>= 2.2.1), libgl1-mesa-glx | libgl1, libglib2.0-0 (>= 2.31.18), libgtk2.0-0 (>= 2.24.0), libjack-jackd2-0 (>= 1.9.5~dfsg-14) | libjack-0.116, libpango-1.0-0 (>= 1.22.0), libpangocairo-1.0-0 (>= 1.14.0), libpangoft2-1.0-0 (>= 1.14.0), libpulse0 (>= 0.99.1), libsoxr0 (>= 0.1.0), libssl1.0.0 (>= 1.0.0), libv4l-0 (>= 0.5.0), libva-x11-1 (>= 1.0.3), libva1 (>= 1.2.0), libvdpau1 (>= 0.2), libx11-6, libxcursor1 (>> 1.1.2), libxrandr2 (>= 2:1.2.0), libxrender1" >> "$tmpdir/freshplayerplugin/package/DEBIAN/control"
echo "Suggests: pepperflashplugin-nonfree" >> "$tmpdir/freshplayerplugin/package/DEBIAN/control"
echo "Priority: optional"  >> "$tmpdir/freshplayerplugin/package/DEBIAN/control"
echo "Homepage: https://github.com/i-rinat/freshplayerplugin" >> "$tmpdir/freshplayerplugin/package/DEBIAN/control"
echo -e "Description: PPAPI-host NPAPI-plugin adapter\n The main goal of this project is to get PPAPI (Pepper)\n Flash player working in Firefox by implementing a\n wrapper, some kind of adapter which will look like\n browser to PPAPI  plugin and look like NPAPI plugin\n for browser." >> "$tmpdir/freshplayerplugin/package/DEBIAN/control"
cd "$pwd"

dpkg-deb -b "$tmpdir/freshplayerplugin/package/" "freshplayerplugin-${ver}-${arch}.deb"

rm -rf "$tmpdir/freshplayerplugin"
exit 0
