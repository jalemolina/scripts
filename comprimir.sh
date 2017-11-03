#!/bin/bash
# Basado en:
# http://blog.desdelinux.net/comprimir-con-7zip-al-maximo-desde-dolphin-en-kde-service-menu/

7za a -t7z -m0=lzma -mx=9 -ms=on $1.7z $1
