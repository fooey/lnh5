'use strict';

require('dotenv').load();

import path from 'path';

import expressReactViews from 'express-react-views';

import compression from 'compression';
import morgan from 'morgan';
import errorhandler from 'errorhandler';


export default function(express) {
    let app = express();

    const isDev  = (process.env.NODE_ENV === 'development');

    app.set('env', process.env.NODE_ENV);
    app.set('case sensitive', true);
    app.set('strict routing', true);

    /*
    *
    *   View Engine
    *
    */

    app.set('views', './components');
    app.set('view engine', 'js');
    app.engine('js', expressReactViews.createEngine({
        transformViews: false,
    }));




    /*
    *
    *   Middleware
    *
    */

    app.use(compression());

    if (isDev) {
        app.use(errorhandler());
        app.use(morgan('dev'));
    }
    else {
        app.use(morgan('combined'));
    }





    /*
    *
    *   Statics
    *
    */

    app.use(express.static('./public'));
    app.use('/nm', express.static('./node_modules'));

    app.get('/favicon.ico', (req, res) => res.sendFile(path.resolve('./public/img/icon.16.png')));







    return app;
};



// function createReactEngine() {
//     function renderFile(filename, options, cb) {
//         let markup = '<!DOCTYPE html>';

//         try {
//             let component = require(filename);

//             // Transpiled ES6 may export components as { default: Component }
//             component = component.default || component;

//             markup += ReactDOMServer.renderToStaticMarkup(
//                 React.createElement(component, options)
//             );
//         }
//         catch (e) {
//             return cb(e);
//         }

//         cb(null, markup);
//     }

//     return renderFile;
// }