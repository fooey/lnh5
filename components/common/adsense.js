import React from 'react';


export default ({
    slot,
    format = 'auto',
}) => (
    <div className='adg-container'>
        <ins className='adsbygoogle'
             data-ad-client='ca-pub-2680194687384513'
             data-ad-slot={slot}
             data-ad-format={format} />
        <script dangerouslySetInnerHTML={{__html: `
            (adsbygoogle = window.adsbygoogle || []).push({});
        `}} />
    </div>
);
