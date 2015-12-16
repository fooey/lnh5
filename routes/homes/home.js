import async from 'async';

import * as libHomes from 'lib/homes';


// import * as PageContent from 'components/homes/default/server';
import * as PageMeta from 'components/homes/default/meta';

const VIEW_PATH = 'homes/default/server';

import Home from 'classes/homes/home';
import AggRatings from 'classes/homes/agg-ratings';
import Extras from 'classes/homes/extras';



// export {DefaultPage as View};
export {VIEW_PATH};

export function render(req, renderCB) {
    const {provnum, ...params} = req.params;

    console.time(`homes::defaultPage::setup`);
    console.log('routes::homes::defaultPage', provnum, params);

    getData(provnum, (err, results) => {
        console.timeEnd(`homes::defaultPage::setup`);

        const home = new Home(results.home);
        const aggRatings = new AggRatings(results.aggRatings);
        const extras = new Extras(results.extras);

        return renderCB(err, {
            viewPath: VIEW_PATH,
            viewProps: {
                pageUrl: PageMeta.getPageUrl(home),
                home: home,
                aggRatings: aggRatings,
                extras: extras,
            },
        });
    });
}



export function getData(provnum, cb) {
    async.auto({
        home: libHomes.getStaticByProvnum.bind(null, provnum),
        aggRatings: libHomes.getAggRatingsByProvnum.bind(null, provnum),
        extras: libHomes.getExtrasByProvnum.bind(null, provnum),
    }, cb);
}



