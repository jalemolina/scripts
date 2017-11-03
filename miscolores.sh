#!/bin/bash

for i in {1..255}
do
    echo -en "\e[38;5;${i}m #"
    if [ $[${i}%8] = 0 ]
    then
        echo ""
    fi
done
