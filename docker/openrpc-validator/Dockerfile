# Image page: <https://hub.docker.com/_/node>
FROM node:12-alpine

USER node:node

WORKDIR /home/node

COPY --chown=node:node ./package.json /home/node/package.json
COPY --chown=node:node ./schema/openrpc.json /home/node/openrpc.json

RUN yarn install

COPY --chown=node:node ./openrpc-validator.js /home/node/openrpc-validator.js

CMD [ "yarn", "run", "openrpc-validator", "-f", "openrpc.json" ]