#!/bin/bash
#NO FUNCIONA

# http://stackoverflow.com/questions/2150882/how-to-automatically-add-user-account-and-password-with-a-bash-script
# quietly add a user without password
adduser --quiet --disabled-password --shell /bin/bash --home /home/m111 --gecos "111 mil" m111

#SI FUNCIONA
# set password
echo "m111:alumno111" | chpasswd
