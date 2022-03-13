# Bashgram Bot

[Versión Online](https://www.notion.so/Bashgram-Bot-6b479484336f4a0a8635e2d6a1b53f3f)

[https://www.notion.so/6b479484336f4a0a8635e2d6a1b53f3f](https://www.notion.so/Bashgram-Bot-6b479484336f4a0a8635e2d6a1b53f3f)

# Bashgram Bot

Bashgram es un bot en Telegram que permite la ejecución de comandos shell en una terminal de Linux. La implementación de esta funcionalidad permite al usuario consultar los archivos almacenados en dicha terminal (simulando un explorador de archivos) y también le brinda la posibilidad de ejecutar algunos comandos que presentan información referente al ordenador.

La interacción con el bot es posible desde los diferentes medios de conexión que ofrece la aplicación Telegram, dentro de los cuales se encuentran dispositivos smartphone, aplicación de escritorio y conexión mediante Telegram web desde su página principal.

# Requisitos

- Sistema Operativo basado en Linux
- Conexión a internet
- ngrok
- librería jq
- Tener una cuenta en Telegram

# Cómo crear y conectar un chatbot de Telegram

Un chatbot es un asistente multifuncional automatizado, que puede recibir y enviar mensajes, sigue las instrucciones paso a paso para crear tu primer chatbot para Telegram Messenger.

Si ya tienes un bot, omite el primer párrafo y echa un vistazo a la siguiente sección.

# Cómo crear un nuevo bot para Telegram

**Paso 1.** Inicia sesión en tu cuenta de Telegram, si no tienes una es necesario crear una nueva.

**Paso 2.** Ingresa @Botfather en la pestaña de búsqueda y elige el siguiente bot:

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/abcb1851-8757-4136-9245-a67b007d453f/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/abcb1851-8757-4136-9245-a67b007d453f/Untitled.png)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/77217bf8-6e7c-41f3-ae93-186c56955a4c/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/77217bf8-6e7c-41f3-ae93-186c56955a4c/Untitled.png)

Ten en cuenta que los bots oficiales de Telegram tienen una marca de verificación azul junto a su nombre.

**Paso 3.** Haz clic en "/start" para activar el bot BotFather.

Nos aparece la siguiente imagen:

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7ece25c3-01e9-4772-a07b-1cf320e87f46/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7ece25c3-01e9-4772-a07b-1cf320e87f46/Untitled.png)

**Paso 4.** Ahora usamos el comando `/newbot`  para crear un nuevo bot:

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1b78acb9-028a-4df0-8ad8-3c105950a868/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1b78acb9-028a-4df0-8ad8-3c105950a868/Untitled.png)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b189104d-5768-441a-836c-7ae4be037f11/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b189104d-5768-441a-836c-7ae4be037f11/Untitled.png)

**Paso 5.** Ahora asignamos un nombre para el bot:

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b64a9583-b1da-4aab-a664-17a84327d314/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b64a9583-b1da-4aab-a664-17a84327d314/Untitled.png)

Si el nombre se encuentra disponible, se creará el bot y obtendrás el token mediante el cual podrás hacer uso de la API de Telegram.

# Creando servidor web

Desde una maquina linux vamos a ejecutar el control de envío y recepción de mensajes para interactuar con la consola.

Para ello debemos crear un servidor web, esto es posible con el comando `nc`  o `netcat`  vamos a alojar nuestra aplicación en uno de los puertos disponibles. Para este caso vamos a usar el puerto 5000 de nuestro localhost.

Ahora probemos nuestro código `nc -l -n 5000` 

A la derecha se ejecuta el listen mode para [localhost:5000](http://localhost:50000)

En la derecha comprobamos su funcionamiento.

El parámetro `-n` Nos permite cancelar la escucha después de que finalice el operador EOF que permite identificar cuando termina. La idea de este es generar pequeñas interrupciones en un ciclo que permita escuchar el web host con persistencia. 

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5d45ff85-a2f4-4a28-b02f-cf95a13e8918/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5d45ff85-a2f4-4a28-b02f-cf95a13e8918/Untitled.png)

Ahora debemos construir una respuesta para el host web

```bash
RESPONSE="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\n<html><h1>Bash Gram Bot <h1><html>\r\n"
```

Con este variable, ahora procedemos a construir el ciclo que va a escuchar el host web

```bash
#!/usr/bin/env bash
clear

RESPONSE="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\n<html><h1>Bash Gram Bot <h1><html>\r\n"

while RESP=$({  echo -en "$RESPONSE"; }  | nc -l -n 5000   ) ; do  
 echo "$RESP"

done
```

Ahora comprobamos, guardamos nuestro archivo como ejecutable con el comando `chmod +x bashgram2`

Comprobamos en nuestro navegador  [`http://localhost:5000/`](http://localhost:5000/)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2521d921-a224-4ce2-b2dc-2ae4d09936bc/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2521d921-a224-4ce2-b2dc-2ae4d09936bc/Untitled.png)

En la consola como estamos guardando la respuesta de la configuración del web host podemos visualizar cada vez que se haga un request GET o POST

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/209ad693-01cc-413a-b83f-a9250dc434c9/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/209ad693-01cc-413a-b83f-a9250dc434c9/Untitled.png)

# Configuración Publica para el servidor

Para hacer uso de los métodos de la API de Telegram debemos tener un Webhook con protocolo https, para no crear un certificado ssl vamos a usar la librería `ngrok` para poder exponer nuestro servidor de local a público.

Ejecutamos el comando `./ngrok http 5000`

Listo, ahora tenemos el túnel con https:

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/db4090ad-2b1b-4bd1-818e-0a7f94f78b19/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/db4090ad-2b1b-4bd1-818e-0a7f94f78b19/Untitled.png)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/17bd9636-3cb8-4837-b251-c4413218162f/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/17bd9636-3cb8-4837-b251-c4413218162f/Untitled.png)

# Asignando Webhook a la API de Telegram

Una vez expuesto nuestro servidor web, debemos indicarle a Telegram la url para que redireccione los mensajes. Para ello usamos el método `setWebhook` y el parámetro `URL`

```bash
https://api.telegram.org/bot${TOKEN}/setWebhook?url=https://f33fc555b0f0.ngrok.io/
```

Al realizar el post del la API recibimos esta respuesta:

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/02fb06b3-6e9b-424e-a6ee-69e34fd72d41/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/02fb06b3-6e9b-424e-a6ee-69e34fd72d41/Untitled.png)

Quiere decir que se configuró correctamente, ahora todo el tráfico lo recibiremos a nuestro [localhost](http://localhost).

Comprobamos ahora el método POST escribiendo un mensaje en nuestro bot:

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0fa76f97-bbd3-46ef-92f8-15466fa5529e/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0fa76f97-bbd3-46ef-92f8-15466fa5529e/Untitled.png)

# Manejo de mensajes

Ahora que recibimos las respuestas en el servidor, debemos capturar los mensajes, la respuesta cuando se escribe en el bot, es un diccionario de tipo Json response, en donde se captura la información del emisor del mensaje.

Para esto vamos a usar la librería `jq` que nos permite manipular este tipo de estructuras de una forma sencilla.

Nótese que la respuesta son las ultimas dos filas de la repuesta del método POST, entonces obviaremos el resto con pipe tail -2 y luego hacemos un parseo con la librería jq para capturar la clave mensaje:

```bash
message=$(echo "$RESP"  | tail -2   | jq -r  '.message')
```

El resultado es el siguiente:

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b9d0cad1-e453-4b28-b8c3-7b12cfbd4d2d/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b9d0cad1-e453-4b28-b8c3-7b12cfbd4d2d/Untitled.png)

De esta forma ya podemos capturar cualquier clave o valor 

# Enviando mensajes a nuestro Bot

Para hacer el envío de mensajes a nuestro bot, vamos a crear una función que usa el estandar `curl` para enviar las respuestas a nuestro bot:

```bash
TOKEN="${TOKEN}"
URL_POST="https://api.telegram.org/bot$TOKEN/sendMessage"
qm='`'

enviaMensaje(){
    post_requ=$(curl -s -X POST $URL_POST -d chat_id=$ID -d text="$MENSAJE"  -d parse_mode=markdown)
}
```

Una vez configurado el servidor, debemos capturar el texto de cada mensaje que hace POST , es decir cada cosa que le escribimos al bot. Cómo se mencionó anteriormente esto lo realizamos con la librería `jq`

```bash
text=$(echo "$RESP"  | tail -2   | jq -r  '.message.text')
```

Ahora siguiendo la idea, que el bot debe ejecutar los comandos que se le envíen, es necesario evaluar ese mensaje en la consola, para ello usaremos el comando `eval`:

```bash
text=$(echo "$RESP"  | tail -2   | jq -r  '.message.text')
echo "$text"
eval $text
```

Este es el resultado:

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ec4c3fe5-3f35-45f0-9cf9-9e863789522d/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ec4c3fe5-3f35-45f0-9cf9-9e863789522d/Untitled.png)

Ahora se debe capturar el ouput de la consola y guardarlo en una variable para responder el mensaje con nuestra función `enviaMensaje()`.

Guardamos el resultado en la variable `MENSAJE`:  

```bash
MENSAJE="$(eval $text 2>&1 )"
```

La expresión `2>&1` es para redirigir de forma estándar el resultado a la variable.

 Ahora es posible hacer el envío del mensaje.

```bash
#!/usr/bin/env bash
clear
echo -e "\e[32m" #Green mode ;3 
RESPONSE="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\n<html><h1>Bash Gram<h1><html>\r\n"

TOKEN="${TOKEN}"
URL_POST="https://api.telegram.org/bot$TOKEN/sendMessage"

qm='`'

enviaMensaje(){
    post_requ=$(curl -s -X POST $URL_POST -d chat_id=$ID -d text="$MENSAJE" )
}

while RESP=$({  echo -en "$RESPONSE"; }  | nc -l -n 5000   ) ; do  

text=$(echo "$RESP"  | tail -2   | jq -r  '.message.text')
echo "$text"
eval $text;

ID=1057837136
MENSAJE="$(eval $text 2>&1 )"

enviaMensaje

done
```

Comprobamos la respuesta con el comando `pwd`:

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/259edb04-766e-4dc9-bb3f-c4223bbabb96/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/259edb04-766e-4dc9-bb3f-c4223bbabb96/Untitled.png)

Listo, el bot se encuentra funcionando correctamente, ahora agregaremos validaciones para mejorar su funcionamiento.

Con la función case, definimos que va a hacer el bot según el método, cómo  se mencionó anteriormente cada solicitud post corresponde a un envío de mensaje, entonces sólo para esos casos se ejecuta la asignación de variables de la respuesta en formato json.  

También se incluye una verificación del user ID para que sólo ese usuario pueda ejecutar los comandos desde el bot y nadie más pueda hacerlo desde otro user id.

```bash
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
        #ID=1057837136
        MENSAJE="$qm $(eval $text 2>&1 ) $qm"
    
        enviaMensaje
    
        echo "Command: "$text
    
    else 
        echo "User ID No coincide"
    fi
  ;;
  * ) echo "...";;
esac
```

# Código final

Añadimos cosas fancys al script y listo.

```bash
#!/usr/bin/env bash
clear
echo -e "\e[32m" #Cambiar a formato verde el echo print
RESPONSE="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\n<html><h1>Bash Gram<h1><html>\r\n"

TOKEN="${TOKEN}"
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

while RESP=$({  echo -en "$RESPONSE"; }  | nc -l -n 5000   ) ; do  #Ciclo que mantiene encendida la conexión del local host
 

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
        #ID=1057837136
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
```

# Resultado Final

Iniciamos nuestro script:

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/84f20d61-8835-401b-8e24-69e2afde5452/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/84f20d61-8835-401b-8e24-69e2afde5452/Untitled.png)

Ingresamos nuestro user ID y aquí se inicia la aplicación:

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/93eb0fc1-c6bc-4906-8ea3-a4518709287d/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/93eb0fc1-c6bc-4906-8ea3-a4518709287d/Untitled.png)

Comprobemos su funcionamiento

A la derecha el texto sin formato tenemos mi usuario de Telegram, realizando el envío de los comandos.

En la parte izquierda un echo para comprobar que se está ejecutando.

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4ad04759-6a54-439f-b6aa-69091ee2e8f6/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4ad04759-6a54-439f-b6aa-69091ee2e8f6/Untitled.png)

Probemos algunos comandos

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0ae9102c-c3d2-4a75-ad9f-3cea1a81d454/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0ae9102c-c3d2-4a75-ad9f-3cea1a81d454/Untitled.png)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b6d6ea37-6a3d-4cdd-b8aa-b904bba3848f/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b6d6ea37-6a3d-4cdd-b8aa-b904bba3848f/Untitled.png)

# Listado de Comandos

A continuación te presentamos una lista de comandos, todos fueron probados para garantizar que puedas hacer uso de ellos:

- cal: Muestra el calendario
- cat >: Crea un fichero
- cat: Ver contenido de un fichero
- date: Muestra la fecha y hora actual
- df: Muestra el espacio libre de los discos/dispositivos
- echo: Escribe un mensaje en la salida estándar
- env: Muestra las variables de entorno
- find: buscar archivos.
- free: Muestra el estado de la memoria
- grep: Busca un texto en un archiv
- head: Muestra las primeras 10 líneas de un archivo o resultado de la ejecución de un comando
- host: Muestra la dirección IP del servidor en una red local.
- hostname: Muestra el nombre del servidor
- id: Muestra información del usuario
- ifconfig: Muestra la configuración del dispositivo de red
- iwconfig: Muestra la configuración del dispositivo de red inalámbrico
- kill: Mata un proceso
- last: Información de los últimos usuarios que han usado el sistema
- ls : Listar ficheros
- lsmod: Muestra los módulos cargados en el sistema
- lspci: Muestra los periféricos conectados al puente PCI
- mkdir: Crear directorio
- mv: Renombrar un fichero/directorio; mover un fichero/directorio.
- ping: Indica si hay respuesta por parte del servidor
- ps: Muestra la lista de procesos del usuario
- pwd: Muestra la ruta del directorio actual
- rm : Eliminar ficheros
- rmdir -r: Remueve un directorio (puede que no este vacío)
- rmdir: Remueve un directorio (debe estar vacío)
- route -n: Muestra la tabla de rutas de la conexión de red
- tail: Muestra las ultimas 10 líneas de un archivo o resultado de la ejecución de un comando
- uname: Proporciona información del sistema operativo
- uptime: Muestra el tiempo transcurrido de encendido de la máquina
- w: Muestra información de los usuarios actuales del sistema
- wc: Muestra el total de líneas, palabras o caracteres en un archivo
- whatis: Da una breve descripción de los comandos
- who: Muestra los usuarios actuales del sistema
- whoami: Muestra nombre de usuario actual

También puedes ejecutar los siguientes comandos, para estos, es necesario hacer uso de "head" o "tail" para acotar el resultado que en ocasiones puede ser demasiado extenso: 

- dmesg | head: Muestra mensajes del arranque de la máquina
- man  | head -n 50: Muestra el manual del comando que le indiquemos
- netstat | head: Muestra estado de la red
- nmap | head: Escanea la red y muestra los puertos que se encuentran disponibles.
- ps aux | head: Muestra la lista de procesos de la máquina
- top | head: Muestra los procesos que se están ejecutando
