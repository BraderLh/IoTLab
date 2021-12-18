# Práctica del Capítulo 10

* **Alumno**: Brayan Alexander Lipe Huamaní
* **Docente**: Pablo Cesar Calcina Ccori

## Motor de Regla y Autenticación
* Establecimiento de una lógica de trabajo para nuestro motor de reglas
* Creción del motor-flujo de reglas relevantes
* Creación de una API para la gestión de reglas
* Comprensión e implementación de la autenticación lógica

## Consideraciones
Para comprobar las ejecuciones y todo lo que comprende este trabajo, dispóngase a ejecutar los siguientes comandos en una consola de git o de su preferencia:
```
$ git clone https://github.com/BraderLh/IoTLab.git
$ git branch
$ git checkout blhbranch
```
Luego de ello, suba e importe el archivo *flows.json* a la interfaz de **Node Red** el cual se encuentra en la parte superior derecha de esta web local. Y listo! empiece a manejar los nodos.

## Desarrollo
### Creación de la Base de datos

Para ello se ejecuta el código fuente llamado **database.sql** en el gestor de base de datos de su preferencia o en el *docker*. Este código agrega un esquema de tabla llamado **ruleEngine** a la base de datos llamada **Time Series** (elaborada en los anteriores pasos).

![DB](https://github.com/BraderLh/IoTLab/blob/blhbranch/iot-pract3/imgs/1.PNG?raw=true)

Al ejecutar dichas líneas se genera la siguiente tabla:

![DB2](https://github.com/BraderLh/IoTLab/blob/blhbranch/iot-pract3/imgs/2.PNG?raw=true)

Luego de ello se procede a insertar las siguientes reglas, utilizando los archivos *.sql* llamados *insert, insert2, insert3* los cuales llegarían a mostrarse de esta forma:

![inserts](https://github.com/BraderLh/IoTLab/blob/blhbranch/iot-pract3/imgs/4.PNG?raw=true)

### Creación de la secuencia de flujo

Para ello, este esquema se basa en un anterior ejercicio del capítulo 7. En cual se crea un Listener de tipo mqtt el cual se encargará de recibir los mensajes enviados por el esquema 2. Luego de ello, la query llamada *create query* se encarga de la inserción de cada uno de esos mensajes de llamada hacia una determinada regla de acuerdo a los campos que se tiene. Es ahí donde la otra query denominada *search rules*  se encargar de seleccionar la tabla que contiene todas nuestras reglas de acuerdo al tópico (topicPattern) y el payload (payloadPattern). 

![Flow sequence](https://github.com/BraderLh/IoTLab/blob/blhbranch/iot-pract3/imgs/3.PNG?raw=true)

Todas estas querys (las cuales están dentro de cada bloque) serán recividas y consultadas en la base de datos, luego de ello la función llamada *call web Hook* realiza un chequeo a todas las reglas activas es decir a las que posean el campo *active* igual 1. El cual mendiante un *loop* se asegura de que todas las reglas son ejecutadas en secuencia de acuerdo a la condición de la regla. Es por ello que al final, el nodo de *request* HTTP utiliza el método *set by msq.method* para ejecutar una llamada HTTP, retornándose así un parse a un objeto de tipo JSON.

![requestnode](https://github.com/BraderLh/IoTLab/blob/blhbranch/iot-pract3/imgs/3.PNG?raw=true)

## Testeo

Finalmente para comprobar las reglas se debe dirigir al flujo 1, el cual sería de esta manera

![requestnode](https://github.com/BraderLh/IoTLab/blob/blhbranch/iot-pract3/imgs/6.PNG?raw=true)

Luego de ello simplemente, se hace un click sobre el cuadrado unicado en la parte izquierda del bloque llamado *timestamp*. Este se intrudicr los parametros del mensaje al nodo de entrada del MQTT. Luego este se ejecuta en el esquema 2, el cual se encarga del método POST enviado por el webHook, creandose así el mensaje y respuesta.

![requestnode](https://github.com/BraderLh/IoTLab/blob/blhbranch/iot-pract3/imgs/7.PNG?raw=true)

Para comprender si se ha insertado las reglas correspondientes en la tabla **Thing Data** simplemente se muestra los valores guardados y se comprueba la ultima inserción de dicho regla.

![requestnode](https://github.com/BraderLh/IoTLab/blob/blhbranch/iot-pract3/imgs/8.PNG?raw=true)

Ahora, no se utilizó el programa Paho utilty, debido a que no es del todo necesario ya que la comprobación se puede realizar de manera sencilla con los pasos descritos anteriormente. 






***Gracias :-)***