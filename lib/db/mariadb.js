'use strict';


/*
*
*   Dependencies
*
*/

import mysql from 'mysql';





/*
*
*   Class Definition
*
*/

class DB {
    constructor(config) {
        this.pool = mysql.createPool({
            host: config.host,
            user: config.user,
            password: config.pass,
            database: config.name,

            connectionLimit : 32,
            multipleStatements: true,
        });
    }



    query(qryString, qryParams=[], queryCB) {
        if (typeof qryParams === 'function') {
            queryCB = qryParams;
            qryParams = [];
        }

        this.pool.query(qryString, qryParams, function(queryError, queryResult, queryFields) {
            if (queryError) { throw queryError; }

            return queryCB(queryError, queryResult, queryFields);
        });
    }


    // statement(qryName, qryString, qryParams, statementCB) {
    //     pg.connect(this.conString, function(connectError, client, releaseConnection) {
    //         if (connectError) {
    //             return statementCB(connectError);
    //         }
    //         else {
    //             client.query({
    //                 name: qryName,
    //                 text: qryString,
    //                 values: qryParams,
    //             }, function(queryError, queryResult) {
    //                 //call `releaseConnection()` to release the client back to the pool
    //                 releaseConnection();

    //                 return statementCB(queryError, queryResult);
    //             });
    //         }
    //     });
    // }
}





/*
*
*   Private Methods
*
*/





/*
*
*   Module Exports, Singleton
*
*/

const lnh = new DB({
    user: process.env.DB_USER,
    pass: process.env.DB_PASS,
    host: process.env.DB_HOST,
    name: 'lnh',
});

// const temp = new DB({
//     user: process.env.DB_USER,
//     pass: process.env.DB_PASS,
//     host: process.env.DB_HOST,
//     name: 'LNH_TEMP',
// });



export default {
    lnh,
    // temp,
};
