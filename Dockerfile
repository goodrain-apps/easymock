FROM node:8.11-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 7300
CMD [ "npm", "start" ]
