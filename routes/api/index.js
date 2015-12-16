// import React from 'react';
// import ReactDOMServer from 'react-dom/server';

import {dump, notFound} from 'routes';

import
    ErrorComponent,
    {getStatusCode}
from 'components/error';

import * as libHomes from 'lib/homes';


export default function(express, app) {
    let router = express.Router();
    let routeHomes = express.Router({mergeParams: true});



    // attach routeHomes
    router.use(
        '/homes',
        routeHomes
    );






    routeHomes.use(
        '/:provnum([A-Za-z0-9]{6})',
        (req, res) =>
        libHomes.getStaticByProvnum(
            req.params.provnum,
            (err, data) =>
            err ? res.status(getStatusCode(err)).send(err) : res.json(data)
        )
    );

    routeHomes.use(
        '/',
        notFound.bind(null, 'Missing provnum parameter')
    );



    // api root
    router.use(
        '/',
        (req, res) => res.send([
            '/homes/:provNum',
            '/homes/:provNum/extras',
            '/homes/:provNum/ratings',
        ])
    );


    return router;
}