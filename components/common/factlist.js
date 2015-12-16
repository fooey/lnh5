import React from 'react';


export const FactList = (props) => (
    <ul className='list-unstyled fact-list'>
        {props.children}
    </ul>
);


export const FactRow = ({label, detail}) => (
    <li title={label}>
        <span className='fact-label'>{label}</span>
        <span className='fact-detail'>{
            detail !== null
            ? detail
            : <span className='muted'>Not Available</span>
        }</span>
    </li>
);
