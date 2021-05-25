FROM node:10

# Create app directory
WORKDIR /ssl_test

#Environment variables
ENV PORT=80
ENV USE_SSL=TRUE
ENV SSL_PATH=/home/botz/certificates

# VOLUME ["/home/botz/certificates/"]
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 80

CMD [ "node", "index.js" ]