#!/bin/sh

SCHEMA=openrpc.json

yarn run lint-schema $SCHEMA
yarn run validate-schema -f $SCHEMA
