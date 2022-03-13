#!/usr/bin/env bash
clear

echo -e "\e[32m" #Cambiar a formato verde el echo print
RESPONSE="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\n<html><h1>Bash Gram<h1><html>\r\n"

TOKEN="aqui_va_el_token"
URL_POST="https://api.telegram.org/bot$TOKEN/sendMessage"
qm='`' # Comillas para asignar el formato Markdown

enviaMensaje(){
    post_requ=$(curl -s -X POST $URL_POST -d chat_id=$ID -d text="$MENSAJE"  -d parse_mode=markdown)
}

#Logo Basgram
cat << "EOF"

      ____             __    ______                        
     / __ )____ ______/ /_  / ____/________ _____ ___      
    / __  / __ `/ ___/ __ \/ / __/ ___/ __ `/ __ `__ \     
   / /_/ / /_/ (__  ) / / / /_/ / /  / /_/ / / / / / /     
  /_____/\__,_/____/_/ /_/\____/_/   \__,_/_/ /_/ /_/      
                                                       ®
EOF

echo -e "\e[34m" #Cambiar a formato azul el echo print
echo "¡Bienvenido a Bashgram Telegram Bot !"
echo "Ingresa tu User ID de Telegram a continuación: "
#read -s ID
read  ID


echo -e "\e[31m" #Cambiar a formato verde el echo print
echo "Estableciendo Conexión..." # Fancy load bar

echo -ne '#####                     (33%)\r'
sleep 2
echo -ne '#############             (66%)\r'
sleep 2
echo -ne '#######################   (100%)\r'
echo -ne '\n'

echo -e "\e[34m" #Cambiar a formato azul el echo print
echo "Conexión creada con exito... "
echo "Ya puedes usar Bashgram 😉"

echo -e "\e[32m" ##Cambiar a formato verde el echo print

while RESP=$({  echo -en "$RESPONSE"; }  | nc -l -N 5000   ) ; do  #Ciclo que mantiene encendida la conexión del local host
 

STR="$RESP"

case $STR in

  *"GET"*)  echo "GET";;
  *"POST"*)  echo "POST"
    #echo "$RESP" | tail -2 
    text=$(echo "$RESP"  | tail -2   | jq -r  '.message.text')
    ID_POST=$(echo   "$RESP"   | tail -2  | jq -r  '.message.from.id')
    
    #echo "ID_POST" $ID_POST
    #echo "ID" $ID
    if [[ "$ID_POST" == "$ID" ]]
    then
        
        MENSAJE="$qm $(eval $text 2>&1 ) $qm"
    
        enviaMensaje
    
        echo "Command: "$text
    
    else 
        echo "User ID No coincide"
    fi
  ;;
  * ) echo "...";;
esac

done
