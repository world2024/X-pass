FROM node:latest

WORKDIR /app

COPY files/* /app

ENV PM2_HOME=/tmp

RUN apt-get update &&\
    apt-get install -y iproute2 vim &&\
    npm install -r package.json &&\
    npm install -g pm2 &&\
    wget -O cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb &&\
    dpkg -i cloudflared.deb &&\
    rm -f cloudflared.deb &&\
   
    chmod +x web.js entrypoint.sh nezha-agent ttyd &&\
    npm install -r package.json

ENTRYPOINT [ "node", "server.js" ]
