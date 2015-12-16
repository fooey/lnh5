'use strict';

import gutil from 'gulp-util';
import plumber from 'gulp-plumber';
import chalk from 'chalk';



function handleError() {
    return plumber({
        errorHandler: function(err) {
            logError(err);
            this.emit('end');
        },
    });
}



function logError(err) {
    if (err.fileName) {
        // regular error
        gutil.log(
            chalk.red(err.name)
            + ': '
             + chalk.yellow(err.fileName.replace(__dirname + '/src/js/', ''))
             + ': '
             + 'Line '
             + chalk.magenta(err.lineNumber)
             + ' & '
             + 'Column '
             + chalk.magenta(err.columnNumber || err.column)
             + ': '
             + chalk.blue(err.description)
        );
    }
    else {
        // browserify error..
        gutil.log(chalk.red(err.name) + ': ' + chalk.yellow(err.message));
    }
}


export default {
    handleError,
};