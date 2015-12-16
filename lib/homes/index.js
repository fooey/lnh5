
// import Home from 'classes/homes/home';
// import AggRatings from 'classes/homes/agg-ratings';
// import Extras from 'classes/homes/extras';
// import Survey from 'classes/homes/survey';

import * as DAO from './dao';




export function getStaticByProvnum(provnum, getCB) {
    return getByProvnumFromDAO(
        'getStaticByProvnum',
        provnum,
        getCB
    );
}

export function getAggRatingsByProvnum(provnum, getCB) {
    return getByProvnumFromDAO(
        'getAggRatingsByProvnum',
        provnum,
        getCB
    );
}

export function getExtrasByProvnum(provnum, getCB) {
    return getByProvnumFromDAO(
        'getExtrasByProvnum',
        provnum,
        getCB
    );
}

export function getSurveyByProvnum(provnum, getCB) {
    return getByProvnumFromDAO(
        'getSurveyByProvnum',
        provnum,
        getCB
    );
}



function getByProvnumFromDAO(getter, provnum, getCB) {
    console.log(`lib::homes:${getter}()`, provnum);

    DAO[getter](provnum, getCB);
}