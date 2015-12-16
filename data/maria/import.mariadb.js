'ust strict';

import path from 'path';

import async from 'async';
import fs from 'fs-extra';

import db from '../lib/db.mariadb.js';
import flr from './linereader.js';


// const request = require('request');



const csvPath = path.resolve(__dirname, 'remote');


let files = fs.readdirSync(csvPath)
    .filter(f => path.extname(f) === '.csv')
    .map(f => {
        const filePath = path.join(csvPath, f);
        const pathInfo = path.parse(filePath);

        return {
            id: pathInfo.name,
            path: filePath,
            columns: getColumns(filePath),
        };
    });



async.eachSeries(files, importFile, eachErr => {
    console.log('IMPORT COMPLETE', eachErr);
});










function getColumns(filePath) {
    let reader = new flr.FileLineReader(filePath, 8196);
    const firstLine = reader.nextLine();
    const columns = firstLine.split(',');

    // console.log(firstLine);
    // console.log(columns);

    return columns;
}



function generateImportQuery(file) {
    const tableCols = file.columns
        .map(c => c.toLowerCase().replace(/[^a-z0-9]{1,}/gi, '_'))
        .map(c => `${c} text`);

    const tableName = 'raw_' + file.id.replace(/[^a-z0-9]{1,}/gi, '_');

    const localPath = file.path.replace(/\\/gi, '\\\\');

    console.log('localPath', localPath);
    // console.log(file.columns);
    // console.log(tableCols);

    const qryString = `
        DROP TABLE IF EXISTS ${tableName};

        CREATE TABLE ${tableName} (
            ${tableCols.join()}
        ) ENGINE=Aria;

        LOAD DATA LOCAL INFILE '${localPath}'
        INTO TABLE ${tableName}
        FIELDS TERMINATED BY ','
        OPTIONALLY ENCLOSED BY '"'
        LINES TERMINATED BY '\n'
        IGNORE 1 LINES;
    `;

    // console.log(qryString);

    return qryString;
}



function importFile(file, cb) {
    const qry = generateImportQuery(file);

    console.log('IMPORT STARTING', file.id);

    db.lnh.query(qry, (queryErr, queryResults) => {
        console.log('IMPORT COMPLETE', file.id, queryErr, queryResults && queryResults.rowCount);
        cb();
    });
}

