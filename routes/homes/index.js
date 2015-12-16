// import React from 'react';
// import ReactDOMServer from 'react-dom/server';


import {dump} from 'routes';

import * as routeDefault from './home';
import * as routeInspectionsOverview from './inspections/overview';
import tempRoutes from './temp.js';

import
    ErrorComponent,
    {getStatusCode}
from 'components/error';



export default function(express, app) {
    let homesRouter = express.Router();
    let facilityRouter = express.Router({mergeParams: true});



    // attach homesRouter
    // app.use(
    //     '/homes',
    //     homesRouter
    // );


    // redirect bare `/homes` => `/directory`
    homesRouter.get(
        '/',
        (req, res) => res.redirect('/directory')
    );


    // attach facilityRouter to homesRouter
    // homesRouter.use(
    //     '/:provnum([A-Za-z0-9]{6})-?:slug([A-Za-z0-9-]+)?',
    //     (req, res, next) => {
    //         libHomes.getStaticByProvnum(req.params.provnum,
    //             (err, home) => {
    //                 console.log('ROUTE::homes', req.originalUrl, req.params);
    //                 res.locals.home = home;
    //                 next();
    //             }
    //         );
    //     }
    // );


    // attach facilityRouter to homesRouter
    homesRouter.use(
        '/:provnum([A-Za-z0-9]{6})-?:slug([A-Za-z0-9-]+)?',
        facilityRouter
    );



    // broken facility fragments
    homesRouter.get(
        '/:provnum([A-Za-z0-9]{6})-?',
        (req, res) => res.renderComponent(routeDefault, req, res)
    );


    facilityRouter.get(
        '/',
        (req, res) => res.renderComponent(routeDefault, req, res)
    );
    // facilityRouter.get(
    //     '/:indexPage(default\.cfm||default.html||default.htm||index.html||index.htm)',
    //     (req, res) => res.redirect(`/homes/${req.params.provnum}-${req.params.slug}`)
    // );


    facilityRouter.get(
        '/jobs',
        tempRoutes.render
    );
    facilityRouter.get(
        '/volunteer',
        tempRoutes.render
    );



    facilityRouter.get(
        '/inspection/complaints',
        tempRoutes.render
    );
    facilityRouter.get(
        '/inspection/deficiencies',
        tempRoutes.render
    );
    facilityRouter.get(
        '/inspection/quality',
        tempRoutes.render
    );
    facilityRouter.get(
        '/inspection/staffing',
        tempRoutes.render
    );
    facilityRouter.get(
        '/inspection',
        (req, res) => res.renderComponent(routeInspectionsOverview, req, res)
    );


    facilityRouter.get(
        '/reviews/:reviewId([0-9]+)/replies/:replyId([0-9]+)',
        tempRoutes.render
    );
    facilityRouter.get(
        '/reviews/:reviewId([0-9]+)/replies/submit',
        tempRoutes.render
    );
    facilityRouter.get(
        '/reviews/:reviewId([0-9]+)/replies',
        tempRoutes.render
    );
    facilityRouter.get(
        '/reviews/:reviewId([0-9]+)',
        tempRoutes.render
    );
    facilityRouter.get(
        '/reviews.rss',
        tempRoutes.render
    );
    facilityRouter.get(
        '/reviews/submit',
        tempRoutes.render
    );
    facilityRouter.get(
        '/reviews',
        tempRoutes.render
    );


    return homesRouter;
}