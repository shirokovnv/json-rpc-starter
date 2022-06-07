# JSON RPC Starter

This is a starter kit for creating JSON schemas based on the [Open-RPC](https://open-rpc.org/) standard, building documentation and api mocks in minutes.

## Depends on

> [docker](https://www.docker.com/)

> [make](https://www.gnu.org/software/make/manual/make.html)

> [avto-dev rpc docs builder](https://github.com/avto-dev/open-rpc-docs-builder-docker)

> [open-rpc mock-server](https://github.com/open-rpc/mock-server)

## Quick start

1. include your api specification to `schema/openrpc.json`.

2. run `make pull`

3. run `make docs-watch` to see api documentation in browser.

4. run `make mock-server` to start example rpc server.

or run `make help` for available commands.