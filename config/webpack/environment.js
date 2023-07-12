// const { environment } = require('@rails/webpacker')

// jQuery(レビュー機能用)
// const webpack = require('webpack')

// environment.plugins.prepend('Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery/src/jquery',
//     jQuery: 'jquery/src/jquery',
//     jquery: 'jquery/src/jquery',
//   })
// )

// module.exports = environment

// const webpack = require('webpack')
// environment.plugins.prepend(
//   'Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery/src/jquery',
//     jQuery: 'jquery/src/jquery',
//     jquery: 'jquery/src/jquery',
//     Popper: 'popper.js'
//   })
// )

// jquery導入(rails6.1用)
const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
  })
)