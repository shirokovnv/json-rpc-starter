#!/usr/bin/env node

const fs = require('fs');
const yargs = require('yargs');
const rpcUtils = require('@open-rpc/schema-utils-js');

const options = yargs
    .usage('Usage: -f <openrpc.json>')
    .option("f", {alias: "file", describe: "open-rpc schema file path", type: "string", demandOption: true})
    .argv;

const file = options.file;

try {
    if (fs.existsSync(file)) {
        const rawSchemaObject = JSON.parse(fs.readFileSync(file));
        const validated = rpcUtils.validateOpenRPCDocument(rawSchemaObject);

        if (validated === true) {
            console.info(`File "${file}" validated without any errors`);

            process.exit(0);
        } else {
            console.error(validated.message);
        }
    } else {
        console.error(`File "${file}" does not exists`);
    }
} catch (err) {
    console.error(err);
}

process.exit(1);
