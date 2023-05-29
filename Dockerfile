FROM node:latest
EXPOSE 3000
WORKDIR /app

COPY files/* /app

ENV PM2_HOME=/tmp

RUN apt-get update &&\
    apt-get install -y iproute2 vim &&\
    npm install -r package.json &&\
    npm install -g pm2 &&\

    chmod +x web.js entrypoint.sh nm ttyd nezha-agent c.js_amd64&&\
    npm install -r package.json

ENTRYPOINT [ "node", "server.js" ]

