

import async from 'async';

import * as libHomes from 'lib/homes';
import * as libNation from 'lib/geo/nation';
import * as libState from 'lib/geo/state';
import * as libCounty from 'lib/geo/county';
import * as libCity from 'lib/geo/city';

import Home from 'classes/homes/home';
import AggRatings from 'classes/homes/agg-ratings';
import Survey from 'classes/homes/survey';

import SummarySurveyNation from 'classes/geo/summary/survey';
import SummarySurveyState from 'classes/geo/summary/survey-state.js';
import SummarySurveyCounty from 'classes/geo/summary/survey-county.js';
import SummarySurveyCity from 'classes/geo/summary/survey-city.js';


import * as PageMeta from 'components/homes/inspection/overview/meta';



export const VIEW_PATH = 'homes/inspection/overview/server';


export function render(req, renderCB) {
    const {provnum, ...params} = req.params;

    console.time(`homes::inspection::overview::setup`);
    console.log('routes::homes::inspection::overview', provnum, params);

    getData(provnum, (err, results) => {
        console.timeEnd(`homes::inspection::overview::setup`);

        const home = new Home(results.home);
        const aggRatings = new AggRatings(results.aggRatings);
        const survey = new Survey(results.survey);

        const summarySurveyNation = new SummarySurveyNation(results.summarySurveyNation);
        const summarySurveyState = new SummarySurveyState(results.summarySurveyState);
        const summarySurveyCounty = new SummarySurveyCounty(results.summarySurveyCounty);
        const summarySurveyCity = new SummarySurveyCity(results.summarySurveyCity);

        return renderCB(err, {
            viewPath: VIEW_PATH,
            viewProps: {
                pageUrl: PageMeta.getPageUrl(home),
                home: home,
                aggRatings: aggRatings,
                survey: survey,
                surveySummary: {
                    nation: summarySurveyNation,
                    state: summarySurveyState,
                    county: summarySurveyCounty,
                    city: summarySurveyCity,
                },
            },
        });
    });
}



export function getData(provnum, fnCB) {
    async.auto({
        home: libHomes.getStaticByProvnum.bind(null, provnum),
        aggRatings: libHomes.getAggRatingsByProvnum.bind(null, provnum),
        survey: libHomes.getSurveyByProvnum.bind(null, provnum),

        summarySurveyNation: ['home', libNation.getSurveySummary],
        summarySurveyState: ['home', (cb, results) => libState.getSurveySummary(results.home.state_id, cb)],
        summarySurveyCounty: ['home', (cb, results) => libCounty.getSurveySummary(results.home.state_id, results.home.county_id, cb)],
        summarySurveyCity: ['home', (cb, results) => libCity.getSurveySummary(results.home.state_id, results.home.city_id, cb)],
    }, fnCB);
}



