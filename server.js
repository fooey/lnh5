'use strict';

require('lib/db');



const nodeEnv      = process.env.NODE_ENV ? process.env.NODE_ENV : 'production';
const serverPort   = process.env.PORT ? process.env.PORT : 3000;


if (nodeEnv !== 'development' && process.env.NEW_RELIC_LICENSE_KEY) {
    require('newrelic');
}




import express from 'express';

import expressConfig from './config/express';
import expressRoutes from './routes';


let app = expressConfig(express, nodeEnv);

expressRoutes(app, express);


app.listen(serverPort, () => {
    console.log('');
    console.log('**************************************************');
    // console.log('Express server started');
    console.log('Time:     %d', Date.now());
    console.log('');
    console.log('PORT:     %d', process.env.PORT);
    console.log('ENV:      %s', process.env.NODE_ENV);
    console.log('PATH:     %s', process.env.NODE_PATH);
    console.log('');
    console.log('cwd:      %s', process.cwd());
    console.log('PID:      %s', process.pid);
    console.log('Platform: %s', process.platform);
    console.log('Arch:     %s', process.arch);
    console.log('Node:     %s', process.versions.node);
    console.log('V8:       %s', process.versions.v8);
    console.log('**************************************************');
    console.log('');
});

/*


const db = require('lib/db');



const qryByZip = `
    SELECT
        p.provnum,
        p.name,
        p.slug,
        p.zipcode,
        gc.city_name
    FROM providers p
        INNER JOIN geo.cities gc ON (p.city_id = gc.city_id)
    WHERE p.zipcode = ANY($1::text[])
    ORDER BY gc.city_name, p.name
    LIMIT 3
`;


db.query(
    qryByZip,
    [['80301', '80501', '80303']],
    onResults.bind(this, qryByZip)
);
db.statement(
    `getProvidersByZip`,
    qryByZip,
    [['84790', '84770', '84078']],
    onResults.bind(this, qryByZip)
);
db.statement(
    `getProvidersByZip`,
    qryByZip,
    [['075001', '06611']],
    onResults.bind(this, qryByZip)
);


function onResults(qry, err, results) {
    if (err) {
        return console.error('error running query', err, qry);
    }
    // console.log(results.rowCount);
    console.log('results: ', results.rows);
}


*/
