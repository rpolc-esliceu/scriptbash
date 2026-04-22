#!/bin/bash

MODUL=$(($1 % 2))


#CONTROL D'ERROR:
if [[ ${#} -eq 0 ]]
then
    echo "ERROR:Has d'introduir 1 numero com a minim"
    exit 1
fi

PARELLS=0
SENARS=0

while [ ${#} -gt 0 ]; do 
    if [ $((${1} % 2)) -eq 0 ];
    then
        PARELLS=$((PARELLS+1))
    else
        SENARS=$((SENARS+1))
    fi
    shift
done

echo "Hi ha ${PARELLS} nÚmeros parells"
echo "Hi ha ${SENARS} nÚmeros senars"
