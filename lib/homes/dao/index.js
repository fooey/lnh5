
import {cachedQuery} from 'lib/db';



export function getStaticByProvnum(provnum, getCB) {
    const qryOptions = {
        name: `getStaticByProvnum`,
        params: [provnum],
        single: true,
        qry: require('./sql/getStaticByProvnum.sql'),
    };

    const cacheOptions = {
        provider: 'homesStatic',
        key: `getStaticByProvnum::${provnum}`,
    };

    return cachedQuery(qryOptions, cacheOptions, getCB);
}



export function getAggRatingsByProvnum(provnum, getCB) {
    const qryOptions = {
        name: `getAggRatingsByProvnum`,
        params: [provnum],
        single: true,
        qry: require('./sql/getAggRatingsByProvnum.sql'),
    };

    const cacheOptions = {
        provider: 'homesSubmissions',
        key: `getAggRatingsByProvnum::${provnum}`,
    };


    return cachedQuery(qryOptions, cacheOptions, getCB);
}



export function getExtrasByProvnum(provnum, getCB) {
    const qryOptions = {
        name: `getExtrasByProvnum`,
        params: [provnum],
        single: true,
        qry: require('./sql/getExtrasByProvnum.sql'),
    };

    const cacheOptions = {
        provider: 'homesStaticExtras',
        key: `getExtrasByProvnum::${provnum}`,
    };

    return cachedQuery(qryOptions, cacheOptions, getCB);
}



export function getSurveyByProvnum(provnum, getCB) {
    const qryOptions = {
        name: `getSurveyByProvnum`,
        params: [provnum],
        single: true,
        qry: require('./sql/getSurveyByProvnum.sql'),
    };

    const cacheOptions = {
        provider: 'homesStaticExtras',
        key: `getSurveyByProvnum::${provnum}`,
    };

    return cachedQuery(qryOptions, cacheOptions, getCB);
}
