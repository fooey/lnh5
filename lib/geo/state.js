
import Survey from 'classes/geo/summary/survey-state.js';

import * as DAO from './dao/state';


export function getSurveySummary(state, getCB) {
    return getFromDAO(
        'getSurveySummary',
        state,
        getCB
    );
}



function getFromDAO(getter, stateId, getCB) {
    console.log(`lib::homes:${getter}()`);

    DAO[getter](stateId, getCB);
}