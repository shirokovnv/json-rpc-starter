FROM node:14-alpine

RUN set -x \
    && mkdir /app \
    && chown node:node /app

USER node:node

COPY --chown=node ./docs-watch /app
COPY --chown=node ./schema /app/src/schema

WORKDIR /app

RUN set -x \
  && npm install --save