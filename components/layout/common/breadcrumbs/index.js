import React from 'react';

import Breadcrumb from './breadcrumb';


export default ({crumbs}) => (
    <ol
        itemScope='true'
        itemType='http://schema.org/BreadcrumbList'
        className='breadcrumb'
    >
        {crumbs.map((crumb, i) =>
            <Breadcrumb
                key = {i}
                position = {i + 1}
                active = {i === crumbs.length - 1}
                {... crumb}
            />
        )}
    </ol>
);
