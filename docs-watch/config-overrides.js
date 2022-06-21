const webpack = require('webpack');

module.exports = function override(config, env) {
  config.resolve.fallback = {
    path: require.resolve('path-browserify'),
    process: require.resolve('process'),
  };

  config.plugins.push(
    new webpack.ProvidePlugin({
      process: 'process/browser',
      Buffer: ['buffer', 'Buffer'],
    }),
  );

  return config;
};
