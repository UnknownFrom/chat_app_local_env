FROM node:latest
COPY ../../../services/chat_api /var/www/chat_api
EXPOSE 8000
WORKDIR /var/www/chat_api
RUN npm install
CMD ["npm", "install"]
CMD ["node", "server.js"]
CMD ["npm", "start"]
#ENTRYPOINT ["node", "/var/www/chat_api/server.js"]
