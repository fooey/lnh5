
import {cachedQuery} from 'lib/db';


export function getSurveySummary(getCB) {
    const qryOptions = {
        name: `getSurveySummary::nation`,
        single: true,
        qry: require('./sql/getSurveySummary.nation.sql'),
    };

    const cacheOptions = {
        provider: 'geoStaticExtras',
        key: `getSurveySummary::nation`,
    };

    return cachedQuery(qryOptions, cacheOptions, getCB);
}
