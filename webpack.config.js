const webpack = require('webpack');
const path = require('path');
const ts_loader = require('ts-loader');
var glob = require("glob");
var ExtractTextPlugin = require('extract-text-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

// TODO maybe export some sort of variable when in production to use everywhere

module.exports = (env, argv) => {
    const isDevelopment = argv.mode === 'development'; // Boolean for development / production

    config = {
        // mode: isDevelopment? 'development' : 'production',
        plugins: [
            new MiniCssExtractPlugin({
                // Extracts css from javascript
                filename: './frontend/css/stylesheet.css',
                chunkFilename: '[id].css',
                ignoreOrder: false,
            })
        ],
        entry: {
            'frontend/scripts/main.js': glob.sync("./src/frontend/scripts/*.ts") // gathers typescript files
            // .concat(glob.sync("./src/frontend/sass/*.s*ss"))  // Gathers sass files (not needed when included from ts)
        },

        // watch: true,
        watchOptions: { // These are needed for watch to work
            poll: true,
            ignored: /node_modules/ // improves performance by a ton
        },
        output: { // Resolves paths locally, a weird hack
            filename: '[name]',
            path: path.resolve(__dirname, './')
        },
        devtool: isDevelopment ? 'source-map' : '', // Add source mappings when not in production
        resolve: {
            // Add '.ts' etc. as a resolvable extension.
            extensions: ['.ts', '.tsx', '.js'],
        },
        module: {
            rules: [
                { // Rule for how to process ts files
                    test: /\.ts$/,
                    use: 'ts-loader'
                },
                { // Rule for how to process sass/scss
                    test: /\.s[ac]ss$/,
                    use: [
                        {
                            loader: MiniCssExtractPlugin.loader, // Used to extract into seperate file
                            options: {
                                hmr: isDevelopment // enables hot swapping of modules if not in production
                            },
                        },
                        // Translates CSS into CommonJS
                        'css-loader',
                        // Compiles Sass to CSS
                        'sass-loader',
                    ],

                }
            ]
        }
    };

    return config;
};
