
import * as cache from 'lib/cache.js';




/*
*
*   PASSTHROUGH DATA PROVIDER
*
*/

import db from './pg.js';
export default db;




/*
*
*   EXPORTED METHODS
*
*/



export function query(name, qry, params, queryCB) {
    return db.statement(name, qry, params, queryCB);
}



export function cachedQuery(qryOptions, cacheOptions, queryCB) {
    const cacheProvider = cache[cacheOptions.provider];
    const cacheKey = cacheOptions.key;

    const resultHandler = (qryOptions.single) ? onResult : onResults;

    console.time(`TIMER::cachedQuery::${cacheKey}`);


    if (cacheProvider.has(cacheKey)) {
        console.log('cachedQuery', cacheOptions.provider, cacheKey, 'cache hit');
        console.timeEnd(`TIMER::cachedQuery::${cacheKey}`);
        return queryCB(null, cacheProvider.get(cacheKey));
    }
    else {
        console.log('cachedQuery', cacheOptions.provider, cacheKey, 'cache miss');
        return query(
            qryOptions.name,
            qryOptions.qry,
            qryOptions.params,
            resultHandler.bind(null, (err, results) => {
                if (!err) {
                    cacheProvider.set(cacheKey, results);
                }
                console.timeEnd(`TIMER::cachedQuery::${cacheKey}`);
                return queryCB(err, results);
            })
        );
    }
}




export function onResult(cb, err, results) {
    if (err) {
        return cb(err);
    }
    else if (!results || !results.rows || results.rows.length !== 1) {
        return cb('NotFound');
    }
    else {
        return cb(null, results.rows[0]);
    }
};



export function onResults(cb, err, results) {
    if (err) {
        return cb(err);
    }
    else if (!results || !results.rows || results.rows.length === 0) {
        return cb('NotFound');
    }
    else {
        // ensure an array of results is returned
        return cb(null, [...results.rows]);
    }
};



/*
*
*   PRIVATE METHODS
*
*/

// function _onResults(isValidResultSize, cb, err, results) {
//     if (err) {
//         return cb(err);
//     }
//     else if (!results || !results.rows || !isValidResultSize(results.rows.length)) {
//         return cb('NotFound');
//     }
//     else {
//         return cb(null, results.rows[0]);
//     }
// }


// function _isSingleRow(numRows) {
//     return numRows === 1;
// }

// function _isMultipleRows(numRows) {
//     return numRows > 0;
// }