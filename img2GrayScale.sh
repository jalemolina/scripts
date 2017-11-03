#!/bin/bash

# Ejemplo: img2GrayScale.sh "0[2-7].jpg"
#           los archivos 02.jpg 03.jpg ...
#         o el nombre del archivo

mkdir grayScale
for img in $1
do
   #convert "$img" -resize 800x600 -quality 90 "convertidas/$img"
    echo "==============================="
    echo "${img##*/}" " nombre completo"
    echo "${img##*.}" " extensión"
    echo "${img%.*}" " solo nombre"
    convert "$img" -colorspace Gray "grayScale/${img%.*}.png"
done
