#/bin/bash

UAH=$(ls -d */)

shopt -s extglob
for j in $UAH 
    do
        if [ -d "$j" ] ; then
            echo "Borrando $j"
            cd "$j"
            NOMBRE=$(pwd $j)
            rm -Rfv *.@(flt|FLT|OCX|Exe|aip|CPL|cpl|f|TLB|tlb|dat|reg|edb|sqm|cab|acm|sqlite|exe|txt|ttf|ico|lnk|dll|Sys|SYS|sys|h|java|png|DLL|Dll|xml|ocx|html|mui|MUI|rs|gif|EXE|api|bmp|OLB|olb|csv|ini|[0..9]|gz|cnv|fae|thm|x3d|ax|rtf|stl|json|icc)
            echo $NOMBRE
            cd ..
        fi
done
