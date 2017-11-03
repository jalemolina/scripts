#!/bin/bash


SUM=$1;
FILE=$2;

# Debe tener los 2 espacios en 'echo' para que funcione
echo "$SUM  $FILE" | sha256sum -c
