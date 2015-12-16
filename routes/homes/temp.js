import React from 'react';
import TempPage from 'components/homes/temp';




function render(req, res, renderCB) {
    const {provnum, ...params} = req.params;


    console.time(`homes::underConstruction::setup`);
    console.log('routes::homes::underConstruction', params);

    return renderCB(null, {
        statusCode: 200,
        View: TempPage,
        props: {
            children: <div>
                <h1>FIXME</h1>
                <pre>{JSON.stringify(req.params, null, '\t')}</pre>
                <pre>{JSON.stringify(res.locals, null, '\t')}</pre>
            </div>,
        },
        pageUrl: null,
    });
}



export default {
    render,
};