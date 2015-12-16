import React from 'react';
import classnames from 'classnames';

export default ({
    home,
    activeTab = 'overview',
}) => (
    <ul className='nav nav-tabs'>
        <li className={classnames({active: activeTab === 'overview' || activeTab === 'default'})}>
            <a href={home.getLink('inspection')}>Overview</a>
        </li>
        <li className={classnames({active: activeTab === 'deficiencies'})}>
            <a href={home.getLink('deficiencies')}>Deficiencies</a>
        </li>
        <li className={classnames({active: activeTab === 'complaints'})}>
            <a href={home.getLink('complaints')}>Complaints</a>
        </li>
        <li className={classnames({active: activeTab === 'owners'})}>
            <a href={home.getLink('owners')}>Owners</a>
        </li>
        <li className={classnames({active: activeTab === 'penalties'})}>
            <a href={home.getLink('penalties')}>Penalties</a>
        </li>
        <li className={classnames({active: activeTab === 'quality'})}>
            <a href={home.getLink('quality')}>Quality</a>
        </li>
        <li className={classnames({active: activeTab === 'staffing'})}>
            <a href={home.getLink('staffing')}>Staffing</a>
        </li>
    </ul>
);