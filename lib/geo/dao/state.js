
import {cachedQuery} from 'lib/db';


export function getSurveySummary(stateId, getCB) {
    const qryOptions = {
        name: `getSurveySummary::state`,
        single: true,
        params: [stateId],
        qry: require('./sql/getSurveySummaryById.state.sql'),
    };

    const cacheOptions = {
        provider: 'geoStaticExtras',
        key: `getSurveySummary::state::${stateId}`,
    };

    return cachedQuery(qryOptions, cacheOptions, getCB);
}
