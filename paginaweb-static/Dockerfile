# Usamos una imagen oficial de Nginx
FROM nginx:alpine

# Copiamos los archivos de la página web al directorio de Nginx
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./styles.css /usr/share/nginx/html/styles.css

# Actualizar curl a la versión 8.11.1-r0
RUN apk update && apk add curl=8.11.1-r0


# Exponemos el puerto 80 (puerto por defecto de Nginx)
EXPOSE 80

# Inicia el servidor Nginx al ejecutar el contenedor
CMD ["nginx", "-g", "daemon off;"]
