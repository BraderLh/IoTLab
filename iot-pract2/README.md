# Práctica del Capítulo 9
* **Alumno**: Brayan Alexander Lipe Huamaní
* **Docente**: Pablo Cesar Calcina Ccori
## Creación de la Interfaz REST
* Creacción de APIs de acceso a datos
* Eliminación de APIS de acceso de datos
## Consideraciones
Para ver las ejecuciones y e archivo Node Red, cambiar a la rama *blhbranch*
```
$ git branch
$ git checkout blhorigin
```
## Prerrequisitos (Opcional)
Para ello en el archivo de configuración de mosquitto (en Windows mosquitto.conf) debemos editar o adicionar las siguientes líneas

```
allow_anonymous false
listener 1883 localhost
acl_file C:\ProgramFiles\mosquitto\broker.acl
```

También se crea un archivo .acl, el cual contiene las siguientes líneas:

```
# GENERAL
topic read timestamp/#

# USERS
user mqtt
topic readwrite #

# APPLICATION AS A USER
user my_app_name
topic read timestamp/#
topic readwrite myapp/%c/#

# PATTERNS
topic read timestamp/#
pattern readwrite users/%u/#
pattern write %c/up/#
pattern read %c/dn/#

```
Si se desea también se puede crear un archivo para la configuración de usuario con su contraseña, para ello siga los pases del siguiente tutorial en [Youtube](https://www.youtube.com/watch?v=72u6gIkeqUc).
 
## Desarrollo
Cada uno de los flujos desarrollados hasta el momento se encuentran en el archivo *.json*. Este deberá ser importado a la interfaz *Node*. los cuales fueron exportados por el node-red. Asu vez, cada uno de las querys se encuentran en la carpeta

## Ejecuciones de las Querys
![Ejecucion](https://github.com/BraderLh/IoTLab/blob/blhbranch/iot-pract2/imgs/1.PNG?raw=true)

![Ejecucion](https://github.com/BraderLh/IoTLab/blob/blhbranch/iot-pract2/imgs/2.PNG?raw=true)

![Ejecucion](https://github.com/BraderLh/IoTLab/blob/blhbranch/iot-pract2/imgs/3.PNG?raw=true)
