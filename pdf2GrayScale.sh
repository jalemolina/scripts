#!/bin/bash

# Ejemplo: img2GrayScale.sh 01.pdf 02.pdf n.pdf

gs -sOutputFile=convertido.pdf -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibiltyLevel=1.4 -dNOPAUSE -dBATCH $@
