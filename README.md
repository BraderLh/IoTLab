# IoT Evaluación Continua Fase2
CSUNSA
Integrantes:
- Apaza Torres, Alexander Rusvell
- Lipe Huamani, Brayan Alexander
- Pilco Pancca, Luz Marina
- Sejje Condori, Erika
# Materiales:
## Hardware:
- Laptop o PC
- Windows 10 o Linux (Cualquier distribución - Ubuntu 20.4.03 LTS)
## Software:
- MySQL (Server, Shell, Workbench o similar)
- Node js (Node Red)
# Pasos:
## Creación de la Base de Datos principal con Series Temporales:
Una vez obtenido todos los materiales que son requisitos esenciales para este procedimiento. Lo primero que se hace es abrir el Sistema Gestor de Bases de Datos Relaciones que se esté usando y proceder a crear una Base de Datos con el nombre de ***tseriesdb***. Se puede realizar manualmente o ejecutando el código fuente situado en el repositorio con el nombre de *init.sql*. De tal forma que quede de la siguiente forma.

## Para ejecutar el contenedor
- Ejecutar: 
> docker-compose up 

- Entrar a la dirección de NODE-RED [localhost:1880](http://localhost:1880)

- Instalar el nodo de MySQL según las instrucciónes del libro



<!-- ![Base de datos de Series Temporales](https://github.com/BraderLh/IoTLab/blob/main/imgs/1.PNG?raw=true)

Luego de ello, se puede crear un usuario específico para esta Base de Datos, pero como es de manera local lo dejaremos con el usaurio por defecto que nos brinda MySQL después de instalarlo.-->
## Creación de la tabla para la Base de Datos
Luego de haber creado la base de datos, se procede a crear la tabla que contendrá este esquema, llamada ***thingdata***. Con los siguiente atributos y tipo de dato, que formarían las siguientes columnas:
- id (int)
- topic (varchar)
- payload (varchar)
- timestamp (varchar)
- deleted (binary)

![Configurando las columnas de forma manual de la tabla](https://github.com/BraderLh/IoTLab/blob/main/imgs/2.PNG?raw=true)
Al final tendría que quedarnos de esta forma:

![Tabla resultante](https://github.com/BraderLh/IoTLab/blob/main/imgs/3.PNG?raw=true)

## Instalación de los Nodos requeridos en Node-Red
Para ello simplemente ejecutamos antes los siguientes comandos en una terminal (de preferencia con permisos elevados o como administrador):
- En Linux
```
> sudo npm install -g --unsafe-perm node-red
```
- En Windows: 
```
> npm install -g --unsafe-perm node-red
```
Ambos instalan la herramienta de Node-RED en el sistema activo. Luego de ello iniciamos la herramiento con el comando:
```
>node-start
```
Al ejecutar dicho comando mostrará lo siguiente:

![Comenzando el Servidor de Node-Red](https://github.com/BraderLh/IoTLab/blob/main/imgs/4.PNG?raw=true)

 Luego de ello, en la barra de direcciones ingresamos la dirección IP: http://localhost:1880/. Posteriormente, se mostrará la siguiente imagen en pantalla.

 ![Interfaz de Node-RED](https://github.com/BraderLh/IoTLab/blob/main/imgs/5.PNG?raw=true)

<<<<<<< HEAD
Entonces, una vez en la interfaz se debe dirigir a la parte superior derecha en el ícono de tres barras. Se busca la opción *Manage palette* y luego se mostrará lo siguiente.

![Administrador de la Paleta](https://github.com/BraderLh/IoTLab/blob/main/imgs/6.PNG?raw=true)

Luego se selecciona el apartado que dice *Install*. Y en la barra buscadora ingresamos: **node-red-node-MySQL**. Aparecerá lo siguiente y le damos en el botón de la derecha con el nombre *Install*. De tal forma que quede así.

![Administrador de la Paleta](https://github.com/BraderLh/IoTLab/blob/main/imgs/7.PNG?raw=true)

## Adición de la capacidad de publicación de MQTT
En esta parte se configura los nodos de salida que pertenecen al *timestamp* y *MQTT*. Para ello se configura el puerto a **1883** para la conección con el *broker*, pero hay que tener en ceunta el puerto **8883** debe estar habilitado.
![Ingreso de los intervalos a 15 segundos](https://github.com/BraderLh/IoTLab/blob/main/imgs/10.PNG?raw=true)

![Adición del nuevo broker](https://github.com/BraderLh/IoTLab/blob/main/imgs/9.PNG?raw=true)

![Ingresando los detalles del servidor y cliente](https://github.com/BraderLh/IoTLab/blob/main/imgs11.PNG?raw=true)

Al final todo quedaría de la siguiente manera:

![Primera secuencia de flujo y una utilidad de timestamp](https://github.com/BraderLh/IoTLab/blob/main/imgs/8.PNG?raw=true)

## Publicador de mensajes con API REST
Para publicar un mensaje desde los nodos en el flujo de mensajes MQTT, se crea un API REST para habilitar lo mismo. Para comenzar, arrastre el nodo HTTP desde el bloque de entrada al espacio de trabajo. El nodo HTTP nos permite manejar solicitudes desde la Web. Una vez colocado en el espacio de trabajo, haga doble clic en el nodo y modifique la configuración del nodo, como se muestra en la imagen.

![Configuración de nodos API y código de función](https://github.com/BraderLh/IoTLab/blob/main/imgs/12.PNG?raw=true)

En esta secuencia de flujo, dos nodos de función tienen código escrito en ellos.
Este código se explica a continuación.

![Creando el mensaje](https://github.com/BraderLh/IoTLab/blob/main/imgs/13.PNG?raw=true)

Al mismo tiempo, estamos respondiendo a la llamada a la API creando una respuesta y enviándola con un nodo de respuesta HTTP.

![Creando el mensaje](https://github.com/BraderLh/IoTLab/blob/main/imgs/14.PNG?raw=true)

Ahora tenemos dos funcionalidades agregadas a nuestra plataforma de IoT: primero, la publicación regular de una marca de tiempo actual en el flujo de mensajes MQTT; en segundo lugar, la API REST para publicar el mensaje en el mismo flujo de mensajes MQTT.

![Secuencia de flujo completa para la API de publicación de mensajes](https://github.com/BraderLh/IoTLab/blob/main/imgs/15.PNG?raw=true)

## Crear el oyente de la base de datos
Para ello, hacemos doble click en el nodo de entrada mqtt y configúrelo, como se muestra en la imagen

![Configuración el nodo de entrada MQTT e implementar](https://github.com/BraderLh/IoTLab/blob/main/imgs/16.PNG?raw=true)

Luego de ello, se conecta estos nodos y configure los ajustes del nodo MySQL, como se muestra en la figura

![Agregue y configure el nodo MySQL con las credenciales propias de base de datos de series temporales](https://github.com/BraderLh/IoTLab/blob/main/imgs/17.PNG?raw=true)

Luego se crea el *query* para que sea ejecutado por el nodo de MySQL y agrega el registro en la base de datos. Todo esto es reflejado en la siguiente imagen:

![Agregue y configure el nodo MySQL con las credenciales propias de base de datos de series temporales](https://github.com/BraderLh/IoTLab/blob/main/imgs/18.PNG?raw=true)

## Recuperador de mensajes de la API REST

Para este paso se necesitan dos requerimientos.
- D1. Obtenga un solo registro de datos. Permite que las aplicaciones y los dispositivos consulten un solo registro de datos del almacenamiento de datos de series temporales en función de un tema o patrón de tema específico.
- D2. Obtenga varios registros de datos en una serie. Permite que las aplicaciones y los dispositivos consulten varios registros de datos en función de un tema o patrón de tema específico.

![1er Nodo de Ingreso](https://github.com/BraderLh/IoTLab/blob/main/imgs/19.PNG?raw=true)

![2do Nodo de Ingreso](https://github.com/BraderLh/IoTLab/blob/main/imgs/20.PNG?raw=true)

Entonces al crear los nodos, el primero se encarga de recuperar solo un mensaje de la base de datos . Mientras que el segundo especifica el número de los últimos mensajes que se recuperarán. Después de ello, se procede a crear la *query* para obtener los registros de la base de datos.

![Query de obtención de registros y los últimos múltiples mensajes actuales](https://github.com/BraderLh/IoTLab/blob/main/imgs/21.PNG?raw=true)

Finalmente verificamos la API, con el siguiente comando.
```
> curl -X GET "http://localhost:1880/get/timestamp/last/5"
```
![Query de obtención de registros y los últimos múltiples mensajes actuales](https://github.com/BraderLh/IoTLab/blob/main/imgs/22.PNG?raw=true)

Como se trata de puntos finales de API GET, también se puede probar directamente desde el navegador. Si no hay suficientes puntos de datos (es decir, si consulta cinco puntos de datos en un tema mientras solo hay tres almacenados, la API responderá solo a los tres que están disponibles). Dependerá de la aplicación posterior aplicar la lógica adecuada en el manejo de tales peticiones.

## Verificación del funcionamiento
En esta sección se prueba los cuatro servicios y utilidades principales a medida que los construimos: el editor de marcas de tiempo actual recurrente, el escucha de la base de datos, el servicio de publicación de datos HTTP y el servicio de recuperación de datos HTTP.

![Verificación si el servicion de Node-RED se está ejecutando](https://github.com/BraderLh/IoTLab/blob/main/imgs/23.PNG?raw=true)

Pauseamos con **Crtl+Z** o eliminamos la tarea mediante el administrador de tarea en Windows. Mientras que en Linux, se realiza con los siguientes comandos
```
> lsof -I :1880

> kill 1363
```
Antes de ello, se instala la ultilidad llamada ***forever*** es una herramienta de línea de comandos simple, que es útil para garantizar que una aplicación basada en Node.js se ejecute continuamente (es decir, para siempre). Es decir, si encuentra un error o falla, este se ocupará del problema y lo reiniciará por usted. Para instalarlo, ejecutamos lo siguiente en la terminal de Node, CMD, entre otros:
```
>npm install forever -g
```
Volviendo a lo anterior, una vez usado el *kill* al proceso. Volvemos a correr el Node-RED pero esta vez con la herramienta *forever*, para ello ejecutamos el siguiente comando.
* En Linux
```
# forever start -l node-red.log --append  /usr/local/bin/node-red
```
* En Windows

```
#forever start -l node-red.log --append /Users/PC-NAME/.node/node_modules/
```
Finalmente, con esto podemos verificar que se está ejecutando y que nuestras API principales son trabajando como se esperaba, tanto utilizando métodos por consola o mediante el navegador. Todo esto, se resumiría en el siguiente gráfico.

![Los servicios críticos de nuestra propia plataforma de IoT ahora son funcionales](https://github.com/BraderLh/IoTLab/blob/main/imgs/24.PNG?raw=true)