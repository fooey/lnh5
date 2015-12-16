
/*
*
*   DEPENDENCIES
*
*/

import async from 'async';


import db, {cachedQuery} from 'lib/db';



/*
*
*   PUBLIC
*
*/



function getByZipcode(zipcode, getCB) {
    // if (Array.isArray(zipcode)) {
    //     return async.concat(
    //         zipcode,
    //         getByZipcode,
    //         getCB
    //     );
    // }


    const qryOptions = {
        name: `getByZipcode`,
        params: [zipcode],
        qry: `
            SELECT zip_id, zipcode, state_id, county_id, city_id, geo
            FROM geo.zipcodes
            WHERE zipcode = ANY($1::text)
                AND city_type = 'D';
        `,
    };

    const cacheOptions = {
        provider: 'zipcodeStatic',
        key: `getByZipcode::${zipcode}`,
    };

    return cachedQuery(qryOptions, cacheOptions, getCB);
}



/*
*
*   EXPORT
*
*/

export default {
    getByZipcode,
};