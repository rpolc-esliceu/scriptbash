#!/bin/bash
function usage(){
    echo "Usage ${0}"
    echo
    echo "has de ser root"
    echo "l'usari no és pot reptir"
    exit 1
}


#Script per crear un usari

#primer comprovam si som l'usari root
if [[ ${UID} -ne 0 ]]
then
    usage
fi

read -p "Introduix el d'usuari: " USER_NAME



echo "creant l'usauri ${USER_NAME}"
