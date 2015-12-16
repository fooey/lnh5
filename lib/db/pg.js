'use strict';

require('dotenv').load();


/*
*
*   Dependencies
*
*/

import pg from 'pg';
// pg.defaults.poolSize = 25;





/*
*
*   Class Definition
*
*/

class DB {
    constructor(config) {
        this.connectionString = `postgres://${config.user}:${config.pass}@${config.host}/${config.name}`;
        // console.log(this.connectionString);
    }



    query(qryString, qryParams=[], cbQuery) {
        if (typeof qryParams === 'function') {
            cbQuery = qryParams;
            qryParams = [];
        }

        this.getClient(
            cbQuery,
            (client, cbCloseClient) =>
                client.query(qryString, qryParams, cbCloseClient)
        );
    }



    statement(qryName, qryString, qryParams, cbStatement) {
        if (arguments.length !== 4) {
            throw ('Invalid arguments passed to db::statement');
        }

        const queryOptions = {
            name: qryName,
            text: qryString,
            values: qryParams,
        };

        this.getClient(
            cbStatement,
            (client, cbCloseClient) =>
                client.query(queryOptions, cbCloseClient)
        );
    }



    getClient(cbConnectionComplete, cbClientComplete) {
        // console.time('db::connect');

        pg.connect(
            this.connectionString,
            (errConnect, client, releaseConnection) => {
                if (errConnect) {
                    return cbConnectionComplete(errConnect);
                }
                else {
                    return cbClientComplete(
                        client,
                        (errClient, resClient) => {
                            releaseConnection();

                            // console.timeEnd('db::connect');

                            cbConnectionComplete(errClient, resClient);
                        }
                    );
                }
            }
        );
    }
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

const lnhConfig = {
    user: process.env.DB_USER,
    pass: process.env.DB_PASS,
    host: process.env.DB_HOST,
    name: 'LNH',
};

const lnh = new DB(lnhConfig);


export default lnh;
