const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const { DefinePlugin } = require('webpack')
const ts = require('./loaders/ts')

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
  type: 'javascript/auto',
})

environment.plugins.prepend(
  'Define',
  new DefinePlugin({
    __VUE_OPTIONS_API__: true,
    __VUE_PROD_DEVTOOLS__: false
  })
)

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('ts', ts)
module.exports = environment
