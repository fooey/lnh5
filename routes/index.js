'use strict';


import apiRouter from './api';
import homesRouter from './homes';
import ErrorComponent, {getStatusCode} from 'components/error';
// import connectLivereload from 'connect-livereload';


module.exports = function(app, express) {

    /*
    *
    * Statics
    *
    */

    // require('./statics.js')(app, express);



    /*
    *
    *  Attach Livereload Module
    *
    */

    if (process.env.NODE_ENV === 'development') {
        app.use(require('connect-livereload')({
            port: 35729,
        }));
    }



    /*
    *
    * Custom Middleware
    *
    */

    app.use(function(req, res, next) {
        res.renderComponent = renderComponent;
        next();
    });




    /*
    *
    * App Routes
    *
    */
    app.get('/', dump);


    app.use(
        '/api',
        apiRouter(express, app)
    );
    app.use(
        '/homes',
        homesRouter(express, app)
    );
};



export function dump(req, res) {
    res.json({
        dump: {
            params: req.params,
        },
    });
}

export function notFound(message, req, res) {
    const content = `NotFound: ${message}`;

    res.status(404).send(content);
}




function renderComponent(routeHandler, req, res) {
    console.time(`TIMER::routes::renderComponent::${req.originalUrl}`);

    return routeHandler.render(req, (err, {
        statusCode = 200,
        viewPath = 'error',
        viewProps = {},
    }) => {
        console.log('render results');

        if (isUrlCanonical(viewProps.pageUrl, req.originalUrl) === false) {
            console.log('NOT CANONICAL');
            console.log('RECEIVED', req.originalUrl);
            console.log('EXPECTED', viewProps.pageUrl);

            return res.redirect(301, viewProps.pageUrl);
        }
        else {

            if (err) {
                statusCode = getStatusCode(err);

                viewProps.error = attachError(err, statusCode);
            }

            console.timeEnd(`TIMER::routes::renderComponent::${req.originalUrl}`);

            return res
                .status(statusCode)
                .render(viewPath, viewProps);
        }
    });
}



function isUrlCanonical(actualUrl, expectedUrl) {
    return (
        !actualUrl
        || actualUrl === expectedUrl
    );
}



function attachError(err, statusCode) {
    return {
        Component: ErrorComponent,
        props: {
            err,
            statusCode,
        },
    };

}