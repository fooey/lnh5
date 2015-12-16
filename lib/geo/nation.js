
import Survey from 'classes/geo/summary/survey';

import * as DAO from './dao/nation';


export function getSurveySummary(getCB) {
    return getFromDAO(
        'getSurveySummary',
        getCB
    );
}



function getFromDAO(getter, getCB) {
    console.log(`lib::homes:${getter}()`);

    DAO[getter](getCB);
}