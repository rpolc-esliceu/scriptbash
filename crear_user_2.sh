#!/bin/bash

function usage(){
    echo "Usage ${0}"
    echo
    echo "has de ser root"
    echo "L'usuari no es por repetir"
    exit 1 #indica que hi ha agut una errada
}

#Script per crear un usuari

#primer comprovam si son l'usuari root
if [[ ${UID} -ne 0 ]]
then
    usage
fi

read -p "Introdueix el nom complet: " COMMENTS
#demanam el nom de l'usuari
read -p "Introduex el nom d'usuari: " USER_NAME
#generarem aleatoriament 
PASSWORD=$(date +%s%N | sha256sum | head -c10)

#creariem l'usuari
useradd -m -c "${COMMENTS}" ${USER_NAME} &> /dev/null
#control de la darrera comanda
if [[ ${?} -ne 0 ]]  
then 
    echo "Errada creant l'usuari"
    exit 1
fi

#canvi de password
echo "${USER_NAME}:${PASSWORD}"  | chpasswd
#comprovam si el canvi de password ha anat be
if [[ ${?} -ne 0 ]]
then
    echo "Errada canviant passwd"
    exit 1
fi

#fer canviar el passwd
passwd -e ${USER_NAME}

#informam del que se ha creat
echo "Usuari creat: ${USER_NAME}"
echo "password generat: ${PASSWORD}"
echo "hOSTname: ${HOSTNAME}"

exit 0