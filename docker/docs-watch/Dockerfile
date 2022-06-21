FROM node:14-alpine

RUN set -x \
    && mkdir /app \
    && chown node:node /app

USER node:node

COPY --chown=node ./docs-watch/public /app/public
COPY --chown=node ./docs-watch/src /app/src
COPY --chown=node ./docs-watch/package.json /app
COPY --chown=node ./docs-watch/package-lock.json /app
COPY --chown=node ./docs-watch/tsconfig.json /app
COPY --chown=node ./docs-watch/config-overrides.js /app
COPY --chown=node ./schema /app/src/schema

WORKDIR /app

RUN set -x \
  && npm install --save