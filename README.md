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

![Base de datos de Series Temporales](https://github.com/BraderLh/IoTLab/blob/main/imgs/1.PNG?raw=true)

Luego de ello, se puede crear un usuario específico para esta Base de Datos, pero como es de manera local lo dejaremos con el usaurio por defecto que nos brinda MySQL después de instalarlo.
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
> sudo npm install -g --unsafe-perm node-red
- En Windows: 
> npm install -g --unsafe-perm node-red

Ambos instalan la herramienta de Node-RED en el sistema activo. Luego de ello iniciamos la herramiento con el comando:
>node-start

Al ejecutar dicho comando mostrará lo siguiente:

![Comenzando el Servidor de Node-Red](https://github.com/BraderLh/IoTLab/blob/main/imgs/4.PNG?raw=true)

 Luego de ello, en la barra de direcciones ingresamos la dirección IP: http://localhost:1880/. Posteriormente, se mostrará la siguiente imagen en pantalla.

 ![Interfaz de Node-RED](https://github.com/BraderLh/IoTLab/blob/main/imgs/5.PNG?raw=true)

Entonces, una vez en la interfaz se debe dirigir a la parte superior derecha en el ícono de tres barras. Darle clik y darle a *Manage palette*.