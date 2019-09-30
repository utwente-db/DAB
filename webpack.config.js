const webpack = require('webpack');
const path = require('path');
const ts_loader = require('ts-loader');
var glob = require("glob");
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

// TODO maybe export some sort of variable when in production to use everywhere

module.exports = (env, argv) => {
    const isDevelopment = argv.mode === 'development'; // Boolean for development / production
    const entries = glob.sync("./src/frontend/scripts/*.ts")
    let fileNames = [];

    for (let i = 0; i < entries.length; i++) {
        let splitstring = entries[i].split("/");
        let totalFileName = splitstring[splitstring.length - 1];
        let filenameSplit = totalFileName.split(".");
        let fileName = filenameSplit[0];
        fileNames.push(fileName);
    }

    let i = 0;
    const entryObject = fileNames.reduce((accumulator, currentValue) => {
        accumulator[currentValue] = entries[i];
        i = i + 1;
        return accumulator;
    }, {});


    config = {
        // mode: isDevelopment? 'development' : 'production',
        plugins: [
            new MiniCssExtractPlugin({
                // Extracts css from javascript
                filename: './css/[name].css',
                chunkFilename: './css/[id].css',
                ignoreOrder: false,
            })
        ],
        entry: entryObject,
        // entry:  glob.sync("./src/frontend/scripts/*.ts"),  // gathers typescript files all into one
        // .concat(glob.sync("./src/frontend/sass/*.s*ss"))  // Gathers sass files (not needed when included from ts)


        // watch: true,
        watchOptions: { // These are needed for watch to work
            poll: true,
            ignored: /node_modules/ // improves performance by a ton
        },
        output: { // Resolves paths locally, a weird hack
            chunkFilename: './scripts/[name].js',
            filename: './scripts/[name].js',
            path: path.resolve(__dirname, './frontend/')
        },
        devtool: isDevelopment ? 'source-map' : '', // Add source mappings when not in production
        resolve: {
            // Add '.ts' etc. as a resolvable extension.
            extensions: ['.ts', '.tsx', '.js'],
        },

        // Uncomment this to split up imports into seperate js file
        // TODO Freek fix that split chunks are not imported

        // optimization: {
        //     splitChunks: {
        //         chunks: 'all'
        //     }
        // },

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

                        // Use version below for more detailed mapping, maybe needed for debugging..?
                        // // Translates CSS into CommonJS
                        // {
                        //     loader: 'css-loader',
                        //     options: {
                        //         sourceMap: isDevelopment
                        //     }
                        // },
                        // // Compiles Sass to CSS
                        // {
                        //     loader: 'sass-loader',
                        //     options: {
                        //         sourceMap: isDevelopment
                        //     }
                        // }

                    ],

                }
            ]
        }
    };

    return config;
}
;
