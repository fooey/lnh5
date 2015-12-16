
import Survey from 'classes/geo/summary/survey-city.js';

import * as DAO from './dao/city';


export function getSurveySummary(stateId, cityId, getCB) {
    return getFromDAOById(
        'getSurveySummary',
        stateId,
        cityId,
        getCB
    );
}



function getFromDAOById(getter, stateId, cityId, getCB) {
    console.log(`lib::homes:${getter}()`);

    DAO[getter](stateId, cityId, getCB);
}