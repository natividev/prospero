FROM node:18.16.0

WORKDIR /usr/src/app

# Creación de reverse proxy con nginx
RUN apt-get update && apt-get install -y nginx
RUN rm /etc/nginx/nginx.conf
COPY ./nginx.conf.production /etc/nginx/nginx.conf
RUN service nginx restart

# Copiamos la aplicación
COPY . .

# Instalamos las dependencias de Node.js
RUN npm install

# Exponemos el puerto 8000
EXPOSE 8000

# Comando para iniciar la aplicación
CMD [ "npm", "run", "start:dev" ]
