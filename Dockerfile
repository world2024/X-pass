FROM node:latest

WORKDIR /app

COPY files/* /app

ENV PM2_HOME=/tmp

RUN apt-get update &&\
    apt-get install -y iproute2 vim &&\
    npm install -r package.json &&\
    npm install -g pm2 &&\

    chmod +x web.js entrypoint.sh n.js ttyd nezha-agent cloudflared&&\
    npm install -r package.json

ENTRYPOINT [ "node", "server.js" ]

