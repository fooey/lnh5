
import {cachedQuery} from 'lib/db';


export function getSurveySummary(stateId, countyId, getCB) {
    const qryOptions = {
        name: `getSurveySummary::county`,
        single: true,
        params: [stateId, countyId],
        qry: require('./sql/getSurveySummaryById.county.sql'),
    };

    const cacheOptions = {
        provider: 'geoStaticExtras',
        key: `getSurveySummary::county::${countyId}`,
    };

    return cachedQuery(qryOptions, cacheOptions, getCB);
}
