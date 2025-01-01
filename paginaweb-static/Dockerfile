# Usamos una imagen oficial de Nginx
FROM nginx:alpine

# Copiamos los archivos de la página web al directorio de Nginx
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./styles.css /usr/share/nginx/html/styles.css

# Exponemos el puerto 80 (puerto por defecto de Nginx)
EXPOSE 80

# Inicia el servidor Nginx al ejecutar el contenedor
CMD ["nginx", "-g", "daemon off;"]
