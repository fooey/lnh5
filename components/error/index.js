import React from 'react';
import classnames from 'classnames';


const ErrorComponent = ({
    err,
    statusCode = 500,
}) => {

    // if (typeof err !== 'Error') {
    //     err = new Error(err);
    // }
    console.log('ERROR', err);

    return (
        <div className='container'>
            <div className='row'>
                <div className='col-lg-24'>

                    <div className={classnames({
                        panel: true,
                        'panel-warning': statusCode === 404,
                        'panel-danger': statusCode !== 404,
                    })}>
                        <div className='panel-heading'>ERROR!</div>
                        <div className='panel-body'>
                            {typeof err === 'string'
                                ? <h1>{err} {statusCode}</h1>
                                : <div>
                                    <h1>{err.name}</h1>
                                    <h2>{err.message}</h2>
                                    <pre>{JSON.stringify(err, null, '\t')}</pre>
                                    <pre>{err.stack}</pre>
                                </div>
                            }
                        </div>
                    </div>

                </div>
            </div>
        </div>
    );
};



export function getStatusCode(err) {
    switch (err) {
        case 'NotFound': return 404;
        case 'Gone': return 410;

        default: return 500;
    }
}



export default ErrorComponent;
