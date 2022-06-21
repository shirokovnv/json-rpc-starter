import ReactDOM from 'react-dom/client';
import Documentation from '@open-rpc/docs-react';
import { OpenrpcDocument } from '@open-rpc/meta-schema';
import { parseOpenRPCDocument } from '@open-rpc/schema-utils-js';
import schema from './schema/openrpc.json';
import './index.css';

parseOpenRPCDocument(schema as OpenrpcDocument)
  .then((rpcSchema) => {
    document.title = rpcSchema.info.title;
    const root = ReactDOM.createRoot(
      document.getElementById('root') as HTMLElement,
    );
    root.render(
      <div className="container">
        <Documentation schema={rpcSchema} />
      </div>,
    );
  })
  .catch((error) => {
    console.log(error);
  });
