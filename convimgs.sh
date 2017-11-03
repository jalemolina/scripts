#!/bin/bash

mkdir convertidas
for img in *.$1
do
   #convert "$img" -resize 800x600 -quality 90 "convertidas/$img"
    echo "==============================="
    echo "${img##*/}" " nombre completo"
    echo "${img##*.}" " extensión"
    echo "${img%.*}" " solo nombre"
    convert "$img" "convertidas/${img%.*}.$2"
done

