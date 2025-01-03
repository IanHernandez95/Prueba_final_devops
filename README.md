# Prueba Final Curso Devops

Este repositorio contiene la prueba final del curso devops de Desafio Latam

Esta prueba contiene la aplicación de los conocimientos aprendidos durante el curso, los cuales incluye AWS, Terraform, Github Actions, Snyk 

## Requerimientos

Los requerimientos para completar la prueba son los siguientes

1. Creación y Gestion de Imagenes Docker
    *   Crear una imagen de Docker para un sitio web estatico (Html/css/js)
    *   Gestionar la imagen usando Amazon Elastic Registry
2. Amazon EC2
    *   Crear una Instancia EC2 que pueda servir como servidor para un servicio adicional de la aplicacion (ejemplo, una API)
    *   Configurar la instancia con una politica de seguridad adecuada (Grupos de Seguridad)
3. Loggin y Monitoreo con Cloudwatch
    *   Configurar Amazon Cloudwatch para capturar logs y metricas de una instancia EC2
    *   Configurar Alarmas en Cloudwatch para notificar si un recurso alcanza un umbral critico
4. AWS Lambda, SQS y SNS
    *   Crear una Funcion Lambda que procese un Mensaje
    *   Integrar Lambda con SNS para publicar las notificaciones
    *   Configurar SQS como cola de mensajes de la Función Lambda
5. Amazon VPC, Subnet, Internet Getaway y Route Tables
    *   Configurar una VPC con una subnet publica y una privada
    *   Configurar un Internet Getaway para permitir el accesso a internet a la subnet publica
    *   Configurar tabla de ruta para asegurar la conexión entre recursos
6. Infraestructura como Codigo con Terraform
    *   Crear archivos de Configuración para aprovisionar la infraestructura en AWS, incluyendo VPC, EC2, y recursos asociados
    *   Asegurarse que los recursos se creen correctamente y esten en ejecución en AWS
7. Automatización con GitHub Actions
    *   Configurar flujo de trabajo para la creacion autonoma de la infraestructura y sus recursos asociados
8. Escaneos de Seguridad con Snyk
    *   Configurar en el flujo de trabajo el escaneo de seguridad de terraform con snyk
    *   Configurar en el flujo de trabajo el escaneo de seguridad de las imagenes de docker con snyk

## Ejecución del Proyecto

> [!IMPORTANT]  
> Previo a la ejecucion del proyecto se debe hacer configuraciones previas - Leer atentamente para una ejecución correcta del codigo

### Configuración del Back-end Terraform

Se debe elegir la forma de manejar el backend de Terraform - Hay 2 opción en el codigo

1. Terraform Cloud

    Para utilizar el backend de terraform cloud se debe crear una cuenta en la pagina web de terraform cloud, una vez iniciada sesion se debe configurar una organización y dentro de esta un workspace.  
    En el Archivo main.tf de la carpeta raiz se debe cambiar el nombre de organizacion y workspace por los configurados en tu espacio de terraform cloud
    Para que este backend funcion se debe configurar dentro de la workspace las siguientes variables de entorno:
      * AWS_ACCESS_KEY_ID - Con la key id del usuario a utilizar en aws 
      * AWS_SECRET_ACCESS_KEY - Con la secret key del usuario a utilizar en aws  
      > [!WARNING]  
      > Se debe marcar las casilla como sensitiva ya que es información sensible 
      
    > [!IMPORTANT]  
    > Importante realizarlo ya que sin estas variables el backend no funcionara  

2. Bucket S3 y tabla de Dynamo

    Para utilizar este backend, en el archivo main de la carpeta raiz se debe comentar el backend de terraform cloud y descomentar el backend de s3.  
    Se debe crear previamente un bucket s3 en aws, y una tabla de dynamoDb.  
    Se debe modificar los datos con los correspondientes al bucket s3 y la tabla para que queden en los creados.  

Si no se configura el backend de forma remota, para eliminar la infraestructura se tendra que realizar manualmente.

### Configuracion de secretos/variables en Github Actions

Se deben configurar los siguientes secretos para que el flujo de trabajo funcione correctamen

* AWS_ACCESS_KEY_ID : Con la key id del usuario a utilizar en aws
* AWS_SECRET_ACCESS_KEY : Con la secret key del usuario a utilizar en aws
* AWS_USER_ID : Con el user id de la cuenta de AWS
* SNYK_TOKEN : Con el token generado de la cuenta de snyk
* SSH_SECRET_KEY : Se debe agregar el contenido del archivo.pem a utilizar para conectarse a la instancia
* TERRAFORM_TOKEN : Con un token generado en la pagina web de Terraform 

Se debe configura la siguiente variable

* AWS_REGION : Con la region de AWS donde se quiere crear la infraestructura

### Modificación del Archivo .tfvars

Dentro el archivo .tfvars se deben modificar las siguientes variables para funcionar con el perfil personal de AWS

* cidr_block    : Modificar con tu rango de IP Deseado
* ami_id        : Modificar con la Ami que se desea utilizar - Configurado para ubuntu 20.04
* instance_type : Modificar con tu tipo de instancia a utilizar
* sns_email     : Modificar con tu email a ser notificado
* key_name      : Modificar con el nombre del par de claves a utilizar


### Expĺicación del flujo de trabajo

