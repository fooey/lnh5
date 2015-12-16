
import Survey from 'classes/geo/summary/survey-county.js';

import * as DAO from './dao/county';


export function getSurveySummary(stateId, countyId, getCB) {
    return getFromDAOById(
        'getSurveySummary',
        stateId,
        countyId,
        getCB
    );
}



function getFromDAOById(getter, stateId, countyId, getCB) {
    console.log(`lib::homes:${getter}()`);

    DAO[getter](stateId, countyId, getCB);
}