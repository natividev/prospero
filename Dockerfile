FROM node:18-alpine

WORKDIR /usr/src/app

# Creacion de reverse proxy con nginx
RUN apt-get install -y nginx
RUN rm /etc/nginx/nginx.conf
COPY ./nginx.conf.production /etc/nginx/nginx.conf
RUN service nginx restart

COPY . .

RUN npm install

EXPOSE 8000

CMD [ "npm", "run", "start:dev" ]
