const path = require('path')
const rootPath = path.resolve(__dirname, '../')

module.exports = ({ config }) => {
  config.module.rules.push({
    test: /\.vue$/,
    loader: "storybook-addon-vue-info/loader",
    enforce: "post"
  });

  return config;
};
