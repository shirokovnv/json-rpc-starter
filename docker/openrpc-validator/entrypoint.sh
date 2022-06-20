#!/bin/sh

SCHEMA=./schema/openrpc.json

yarn run format $SCHEMA
yarn run lint $SCHEMA
yarn run validate -f $SCHEMA
