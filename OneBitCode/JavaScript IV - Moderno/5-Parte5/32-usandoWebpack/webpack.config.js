const path = require('path')
const MiniCssExtractPlugin = require("mini-css-extract-plugin")

module.exports = {
    entry: {
        main: './src/index.js',
    },
    mode: 'development',
    // output: {
    //     path: path.resolve(__dirname, 'public'),
    //     filename: '[name].bundle.min.js'
    // }
    module: { //incluindo loaders
        rules: [{
            test: /\.css$/, //em que arquivos o webpack irá aplicar os loaders
            use: [MiniCssExtractPlugin.loader, 'css-loader']
        }]
    },
    plugins: [
        new MiniCssExtractPlugin()
    ]
}