# Image page: <https://hub.docker.com/_/node>
FROM node:12-alpine

RUN set -x \
    && apk add --no-cache bash git openssh \
    && git --version && bash --version && ssh -V && npm -v && node -v && yarn -v

WORKDIR /app

RUN yarn add @open-rpc/mock-server@1.7.4

COPY schema /app

EXPOSE 8080

CMD ["yarn", "run", "open-rpc-mock-server", "-d", "openrpc.json", "-p", "8080"]
