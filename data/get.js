'use strict';

const fs = require('fs-extra');
const path = require('path');


const async = require('async');
const request = require('request');


const remoteHost = 'data.medicare.gov';
const csvPath = path.resolve(__dirname, 'remote');


fs.ensureDirSync(csvPath);


const files = [
    {
        id: 'r5ix-sfxw',
        name: 'Deficiencies',
    },
    {
        id: 'y2hd-n93e',
        name: 'Ownership',
    },
    {
        id: 'tbry-pc2d',
        name: 'Survey Summary',
    },
    {
        id: '4pq5-n9py',
        name: 'Provider Info',
    },
    {
        id: 'djen-97ju',
        name: 'Quality Measures',
    },
    {
        id: 'g6vv-u9sr',
        name: 'Penalties',
    },
];

let numComplete = 0;


/*
*   Download each file
*/

async.each(
    files,
    downloadFile,
    console.log.bind(console, 'DONE')
);


function downloadFile(file, downloadFileCB) {
    const localPath = getLocalPath(file.id);
    const remotePath = getRemotePath(file.id);

    const requestParams = {
        url: remotePath,
        gzip: true,
    };

    console.log('downloading start', file.name, remotePath, localPath);


    request(requestParams)
        .pipe(fs.createWriteStream(localPath))
        .on('error', (err) => {
            console.log('error', file.name, localPath);
            console.log('error', err);

            fs.unlink(localPath);
            downloadFileCB();
        })
        .on('finish', () => {
            numComplete++;
            console.log(`finish ${numComplete}/${files.length}`, file.name, localPath);
            downloadFileCB();
        });
}


function getRemotePath(fileId) {
    return `https://${remoteHost}/api/views/${fileId}/rows.csv?accessType=DOWNLOAD`;
}


function getLocalPath(fileId) {
    return path.resolve(csvPath, fileId + '.csv');
}
