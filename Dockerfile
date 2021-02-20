FROM node:14.3.0

WORKDIR /srv
ENV PATH=${PATH}:./node_modules/.bin
ENV NODE_PATH=/srv/node_modules
ADD application/package.json ./
ADD application/package-lock.json ./
RUN npm ci

RUN ngcc
ADD application/ .
RUN ng build --prod
