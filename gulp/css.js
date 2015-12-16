'use strict';

import path from 'path';

import gulp from 'gulp';
import livereload from 'gulp-livereload';

import rename from 'gulp-rename';
import sourcemaps from 'gulp-sourcemaps';
// import es from 'event-stream';

import sass from 'gulp-sass';
import postcss from 'gulp-postcss';
import cssnano from 'cssnano';
import autoprefixer from 'autoprefixer';

import util from './util';





function gulpTasks(bundles) {

    let tasks = [];


    bundles.forEach(bundle => {

        const taskname = `css-compile-${bundle.name}`;


        gulp.task(taskname, [], function() {

            console.log(
                Date.now(),
                'Bundling CSS',
                path.relative('.', bundle.entry),
                path.relative('.', path.join(bundle.dest, bundle.name)),
            );

            return gulp.src(bundle.entry)

                .pipe(util.handleError())

                .pipe(rename(bundle.name))
                .pipe(sourcemaps.init())
                .pipe(sass())
                // .pipe(sourcemaps.write('./'))
                // .pipe(gulp.dest(bundle.dest))

                // .pipe(sourcemaps.init({loadMaps: true}))
                .pipe(postcss([cssnano()]))
                .pipe(postcss([autoprefixer()]))

                .pipe(rename({suffix: '.min'}))
                .pipe(sourcemaps.write('.'))
                .pipe(gulp.dest(bundle.dest))
                .pipe(livereload());
        });


        tasks.push(taskname);
        gulp.watch(bundle.watch, [taskname]);

    });



    gulp.task('css-compile', tasks, function(cb) {
        cb();
    });



    return;
}



export default gulpTasks;
