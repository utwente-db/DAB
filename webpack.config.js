const webpack = require('webpack');
const path = require('path');
const ts_loader = require('ts-loader');
var glob = require("glob");

// function getPlugin() {
//     if (process.env.NODE_ENV === 'production') {
//         return [
//             new webpack.optimize.UglifyJsPlugin()
//         ];
//     } else {
//         return [];
//     }
// }

config = {
    mode: 'development', // TODO change to production when in production or let freek add a new "npm run" thing
    entry:
        glob.sync("./src/frontend/scripts/*.ts"), //.concat(glob.sync("./src/frontend/sass/*.s*ss")),

    output: {
        filename: '[name].js',
        path: path.resolve(__dirname, './yeeter/')
    },
    devtool: 'inline-source-map', // TODO comment out in production
    resolve: {
        // Add '.ts' and '.tsx' as a resolvable extension.
        extensions: ['.ts', '.tsx', '.js', '.sass', '.scss'],


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
            // {
            //     // include: path.resolve(__dirname, '/src/frontend/scripts/'),
            //     test: /\.s.ss$/,
            //     use: [
            //         'style-loader',
            //         {
            //             loader: 'css-loader',
            //             options: {
            //                 minimize: true
            //             }
            //         },
            //         'sass-loader?sourceMap'
            //     ]
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

module.exports = config;