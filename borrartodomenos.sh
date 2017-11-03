#/bin/bash

UAH=$(ls -d */)

shopt -s extglob
for j in $UAH 
    do
        if [ -d "$j" ] ; then
            echo "Borrando $j"
            cd "$j"
            NOMBRE=$(pwd $j)
            rm -Rfv !(*.jpg|*.JPG|*.Jpg|*.jpeg|*.JPEG|*.Jpeg)
            echo $NOMBRE
            cd ..
        fi
done
