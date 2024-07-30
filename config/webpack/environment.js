const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const { DefinePlugin } = require('webpack')

environment.loaders.prepend('vue', {
  test: /\.vue$/,
  use: [
    {
      loader: 'vue-loader'
    }
  ]
})

environment.loaders.append('mjs', {
  test: /\.mjs$/,
  include: /node_modules/,
  type: 'javascript/auto'
})

environment.plugins.prepend(
  'Define',
  new DefinePlugin({
    __VUE_OPTIONS_API__: true,
    __VUE_PROD_DEVTOOLS__: false
  })
)

environment.config.merge({
  node: false
})

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
module.exports = environment
