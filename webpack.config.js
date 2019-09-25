const webpack = require('webpack');
const path = require('path');
const ts_loader = require('ts-loader');
var glob = require("glob");
var ExtractTextPlugin = require('extract-text-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin')

// TODO maybe export some sort of variable when in production to use everywhere

// function getPlugin() {
//     if (process.env.NODE_ENV === 'production') {
//         return [
//             new webpack.optimize.UglifyJsPlugin()
//         ];
//     } else {
//         return [];
//     }
// }

module.exports = (env, argv) => {
const isDevelopment = argv.mode === 'development';

    config = {
        // mode: isDevelopment? 'development' : 'production',
        plugins: [
            new MiniCssExtractPlugin({
                // Options similar to the same options in webpackOptions.output
                // all options are optional
                filename: './frontend/css/stylesheet.css',
                chunkFilename: '[id].css',
                ignoreOrder: false, // Enable to remove warnings about conflicting order
            })
        ],
        entry: {
            'frontend/scripts/main.js': glob.sync("./src/frontend/scripts/*.ts")
            // 'frontend/css/style_webpack.css': glob.sync("./src/frontend/sass/*.s*ss")
        },

        // watch: true,
        watchOptions: {
            poll: true,
            ignored: /node_modules/
        },
        output: {
            filename: '[name]',
            path: path.resolve(__dirname, './')
        },
        devtool: isDevelopment ? 'source-map' : '',
        resolve: {
            // Add '.ts' and '.tsx' as a resolvable extension.
            extensions: ['.ts', '.tsx', '.js'],


        },
        module: {
            rules: [
                // {
                //     test: /\.js$/,
                //     include: './src/frontend/scripts',
                //     use: {
                //         loader: "babel-loader"
                //     }
                // },
                {
                    // include: path.resolve(__dirname, '/src/frontend/scripts/'),
                    test: /\.ts$/,
                    use: 'ts-loader'
                },
                {
                    test: /\.s[ac]ss$/,
                    use: [


                        {
                            loader: MiniCssExtractPlugin.loader,
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
                // {
                //     // include: path.resolve(__dirname, '/src/frontend/scripts/'),
                //     test: /\.s.ss$/,
                //     loader: ExtractTextPlugin.extract('style-loader', 'css-loader?sourceMap!sass-loader?sourceMap')
                //     // use: [
                //     //     'style-loader',
                //     //     {
                //     //         loader: 'css-loader',
                //     //         options: {
                //     //             minimize: true
                //     //         }
                //     //     },
                //     //     'sass-loader?sourceMap'
                //     // ]
                // }


            ]
        }
    };

// config = {
//     entry: {
//         main: ['./src/frontend/scripts/', './src/frontend/sass/']
//     },
//     output: {
//         publicPath: './frontend/scripts',
//         filename: '[name].js',
//         path: path.resolve(__dirname, './frontend/scripts/')
//     },
//     resolve: {
//         // Add '.ts' and '.tsx' as a resolvable extension.
//         extensions:['.ts', '.tsx', '.js'],
//         alias: {
//
//         }
//     },
//     module: {
//         rules: [
//             // {
//             //     test: /\.scss$/,
//             //     use: [
//             //         'style-loader',
//             //         {
//             //             loader: 'css-loader',
//             //             options: {
//             //                 minimize: true
//             //             }
//             //         },
//             //         'sass-loader?sourceMap'
//             //     ]
//             // },
//             {
//                 test: /\.tsx?$/,
//                 use: 'ts-loader'
//             }
//         ]
//     },
//     plugins: getPlugin()
// };

return config;
}
