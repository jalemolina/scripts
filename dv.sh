#!/bin/bash
# Recibe la dirección de una lista de reproducción de youtube o busca un archivo
# "list.dl" con la lista para descargarla usando youtube-dl

if [ $1 <> 0 ];
then
    LISTA=$1;
else
    LISTA="list.dl";
fi
if [ -f $LISTA ];
then
    youtube-dl --console-title -c -o "%(autonumber)s_%(title)s.%(ext)s" -a $LISTA;
else
    echo "No se pudo encontrar la lista de descarga.";
    echo "";
    exit 1;
fi;
exit 0;
