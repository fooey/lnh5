'use strict';

import path from 'path';

import gulp from 'gulp';
import livereload from 'gulp-livereload';


import tasksServer from './gulp/server';
import tasksJS from './gulp/javascript';
import tasksCSS from './gulp/css';

// import util from './gulp/util';


/*
*
*   Task Modules
*
*/


let paths = {
    src: './public/src',
    dist: './public/dist',
};
paths.css = {
    src: path.join(paths.src, 'css'),
    dist: path.join(paths.dist, 'css'),
};
paths.js = {
    src: path.join(paths.src, 'js'),
    dist: path.join(paths.dist, 'js'),
};




const jsBundles = [{
    entry: path.resolve('./components/app.js'),
    dest: path.resolve('./public/dist/js/'),
    name: 'app.js',
}];




const cssBundles = [{
    entry: path.join(paths.css.src, 'bootstrap/index.scss'),
    dest: paths.css.dist,
    watch: ['./public/src/css/bootstrap/**/*.scss'],
    name: 'bootstrap.css',
}, {
    entry: path.join(paths.css.src, 'app.scss'),
    dest: paths.css.dist,
    watch: [
        `${paths.css.src}/**/*.scss`,
        `!${paths.css.src}/bootstrap/**`,
        `${paths.css.src}/bootstrap/_variables.scss`,
    ],
    name: 'app.css',
}];

tasksJS(jsBundles);
tasksCSS(cssBundles);
tasksServer();





/*
*
*   Task Wrappers
*
*/

gulp.task('default', ['compile', 'reload'], function(cb) {
    cb();
});


gulp.task('prod', ['compile', 'server-prod'], function(cb) {
    cb();
});



gulp.task('compile', ['js-compile', 'css-compile'], function(cb) {
    cb();
});


gulp.task('reload', ['server', 'compile'], function(cb) {
    livereload.listen();

    gulp.watch([
        './server.js',
        './server.babel.js',
        './classes/**/*.js',
        './components/**/*.js',
        './config/**/*.js',
        './lib/**/*.js',
        './routes/**/*.js',
    ], ['server-restart']);

    cb();
});

