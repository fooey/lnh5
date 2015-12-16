'use strict';

import _ from 'lodash';

import gulp from 'gulp';
import livereload from 'gulp-livereload';
// import server from 'gulp-develop-server';
import {spawn} from 'child_process';

// import dotenv from 'dotenv';
// dotenv.load();

let node;
let env;
let envDefault = {
    NODE_ENV: 'development',
    NODE_PATH: './',
    PORT: '3000',
};


function gulpTasks() {

    gulp.task('server', ['compile'], function(cb) {
        env = _.merge(envDefault, {
            NODE_ENV: 'development',
        });

        return startServer(cb);
    });



    gulp.task('server-prod', ['compile'], function(cb) {
        env = _.merge(envDefault, {
            NODE_ENV: 'production',
            // NEW_RELIC_NO_CONFIG_FILE: true,
            // NEW_RELIC_LICENSE_KEY: null,
            // NEW_RELIC_APP_NAME: ['gw2w2w.com'],
            // NEW_RELIC_LOG: 'stdout',
            // NEW_RELIC_LOG_LEVEL: 'info',
        });

        return startServer(cb);
    });



    gulp.task('server-restart', [], function(cb) {
        console.log('gulp::server-restart');

        return startServer(() => {
            livereload.reload('');
            cb();
        });
    });


    return gulp;
}




function startServer(cb) {
    console.log('spawn server', 'env', env);

    if (node) {
        node.kill();
    }

    node = spawn('node', ['./server.babel.js'], {
        stdio: 'inherit',
        env,
    });

    node.on('close', function(code) {
        if (code === 8) {
            gulp.log('Error detected, waiting for changes...');
        }
    });

    cb();
}



// clean up if an error goes unhandled.
process.on('exit', function() {
    if (node) {
        node.kill();
    }
});



export default gulpTasks;
