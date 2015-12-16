'ust strict';

/*
*
*   Module Dependencies
*
*/

//  System Modules
import path from 'path';

// NPM Modules
import async from 'async';
import fs from 'fs-extra';

// App Modules
import db from 'lib/db';
import flr from '../linereader';



/*
*
*   Module Globals
*
*/

const csvPath = path.resolve(__dirname, '../remote');

const files = getFiles(csvPath);

let numComplete = 0;



/*
*
*   Main
*
*/

async.eachSeries(
    files,
    importFile,
    eachErr => {
        if (eachErr) { throw eachErr; }

        console.log('DATA LOAD COMPLETE :: RESULT');
    }
);




/*
*
*   Private Methods
*
*/

function getColumns(filePath) {
    let reader = new flr.FileLineReader(filePath);

    const firstLine = reader.nextLine();
    const columns = firstLine.split(',');

    return columns;
}



function getImportQueryString(file) {
    const pattern = /[^a-z0-9]{1,}/gi;

    const tableCols = file.columns
        .map(
            col => col
                .toLowerCase()
                .replace(pattern, '_')
                .concat(' text')
        );

    const tableName = 'raw_' + file.id.replace(pattern, '_');

    // console.log(file.columns);
    // console.log(tableCols);
    // console.log('localPath', localPath);

    const qryString = `
        DROP TABLE IF EXISTS import.${tableName};

        CREATE TABLE import.${tableName} (
            ${tableCols.join()}
        );

        COPY import.${tableName}
        FROM '${file.path}'
        WITH CSV HEADER;
    `;

    // console.log(qryString);

    return qryString;
}



function importFile(file, cb) {
    const qry = getImportQueryString(file);

    console.log('LOAD STARTING', file.id);

    db.query(qry, (queryErr, queryResults) => {
        if (queryErr) {
            console.error(queryErr);
        }
        numComplete++;

        console.info(`${numComplete}/${files.length} LOAD COMPLETE`, file.id, queryErr, queryResults && queryResults.rowCount);
        cb();
    });
}



function getFiles(readPath) {
    return fs.readdirSync(readPath)
        .filter(f => path.extname(f) === '.csv')
        .map(f => {
            const filePath = path.join(readPath, f);
            const pathInfo = path.parse(filePath);

            return {
                id: pathInfo.name,
                path: filePath,
                columns: getColumns(filePath),
            };
        });
}
