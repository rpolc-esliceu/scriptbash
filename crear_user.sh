#!/bin/bash

#Script per crear un usari

#primer comprovam si som l'usari root
if [[ ${UID} -ne 0 ]]
then
    echo "Usage ${0}"
    echo
    echo "has de ser root"
    exit 1
fi

read -p "Introduix el d'usuari: " USER_NAME

echo "creant l'usauri ${USER_NAME}"