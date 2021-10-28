FROM node:latest
COPY ../../../services/chat_api /var/www/chat_api
WORKDIR /var/www/chat_api
RUN npm i -g nodemon
RUN npm install
CMD ["nodemon", "server.js"]
#ENTRYPOINT ["node", "/var/www/chat_api/server.js"]
