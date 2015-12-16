
import {cachedQuery} from 'lib/db';


export function getSurveySummary(stateId, cityId, getCB) {
    const qryOptions = {
        name: `getSurveySummary::city`,
        single: true,
        params: [stateId, cityId],
        qry: require('./sql/getSurveySummaryById.city.sql'),
    };

    const cacheOptions = {
        provider: 'geoStaticExtras',
        key: `getSurveySummary::city::${cityId}`,
    };

    return cachedQuery(qryOptions, cacheOptions, getCB);
}
