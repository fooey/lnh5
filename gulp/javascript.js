'use strict';

import path from 'path';

import gulp from 'gulp';
import livereload from 'gulp-livereload';


import vinylBuffer from 'vinyl-buffer';
import vinylSource from 'vinyl-source-stream';
import es from 'event-stream';

import rename from 'gulp-rename';
import sourcemaps from 'gulp-sourcemaps';

import browserify from 'browserify';
import watchify from 'watchify';
import uglify from 'gulp-uglify';

import aliasify from 'aliasify';
import shimify from 'browserify-shim';
import babelify from 'babelify';

import util from './util';




const CONFIG_BROWSERIFY = Object.assign(
    watchify.args, {
        debug: true,
    }
);

const CONFIG_UGLIFY = {
    // report: 'min',
    acorn: true,
    stripBanners: true,
    mangle : true,
    compress: {
        unsafe : true,
        drop_console: true,
    },
};




function gulpTasks(bundles) {

    gulp.task('js-compile', function() {

        let tasks = bundles.map(bundle => {
            // let bundler = watchify(browserify(bundle.entry, CONFIG_BROWSERIFY))
            let bundler = watchify(browserify(bundle.entry, CONFIG_BROWSERIFY))
                .transform(babelify, { /* opts */ })
                .transform(aliasify, { /* opts */ })
                .transform(shimify, { /* opts */ })

                .on('update', function() {
                    bundleJs(bundler, bundle);
                });

            return bundleJs(bundler, bundle);
        });

        return es.merge.apply(null, tasks);
    });



    function bundleJs(bundler, bundle) {
        console.log(
            Date.now(),
            'Bundling JS',
            path.relative('.', bundle.entry),
            path.relative('.', path.join(bundle.dest, bundle.name)),
        );

        return bundler
            .bundle()
            .pipe(vinylSource(bundle.name))
            .pipe(vinylBuffer())

            .pipe(util.handleError())

            .pipe(gulp.dest(bundle.dest))

            .pipe(rename({suffix: '.min'}))
            .pipe(sourcemaps.init({loadMaps: true}))
                .pipe(uglify(CONFIG_UGLIFY))
            .pipe(sourcemaps.write('.'))
            .pipe(gulp.dest(bundle.dest))
            .pipe(livereload());
    }


    return;
}



export default gulpTasks;
