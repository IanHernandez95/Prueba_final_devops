# Imagen base de Node.js 22
FROM node:22-alpine

# Actualiza npm a la versión 11.0.0
RUN npm install -g npm@11.0.0

# Configurar el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo package.json y realizar instalación de dependencias
COPY package*.json ./
RUN npm install

# Copiar el resto del código al contenedor
COPY . .

# Exponer el puerto 3000
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["npm", "start"]