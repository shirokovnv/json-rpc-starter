# Image page: <https://hub.docker.com/_/node>
FROM node:12-alpine

USER node:node

WORKDIR /home/node

COPY --chown=node:node ./package.json /home/node/package.json
COPY --chown=node:node ./.eslintrc.js /home/node/.eslintrc.js
COPY --chown=node:node ./schema/openrpc.json /home/node/openrpc.json

RUN yarn install

COPY --chown=node:node ./openrpc-validator.js /home/node/openrpc-validator.js
COPY --chown=node:node ./docker/openrpc-validator/entrypoint.sh ./entrypoint.sh

CMD [ "sh", "entrypoint.sh" ]