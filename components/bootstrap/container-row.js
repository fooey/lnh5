import React from 'react';

export default ({
    full = false,
    ...props,
}) => (
    <div className='container'>
        <div className='row'>
            {(full)
                ? <div className='col-lg-24'>{props.children}</div>
                : props.children
            }
        </div>
    </div>
);
