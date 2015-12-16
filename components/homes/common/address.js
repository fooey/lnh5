import React from 'react';

import * as libString from 'lib/string';

import Icon from 'components/common/icon';


const Address = ({
    phoneNumber,
    street,
    zipcode,
    city,
    state,
}) => {
    return (
        <address itemProp='address' itemScope='true' itemType='http://schema.org/PostalAddress'>
            <span className='address'>
                <Icon name='map-marker' />
                <span className='address-part street' itemProp='streetAddress'>{street}</span>
                <span className='address-part city' itemProp='addressLocality'><a href={city.getLink()}>{city.name}</a></span>
                <span className='address-part state' itemProp='addressRegion'><a href={state.getLink()}>{state.abbr}</a></span>
                <span className='address-part zipcode' itemProp='postalCode'><a href={zipcode.getLink()}>{zipcode.zipcode}</a></span>
            </span>
            {phoneNumber
                ? (
                    <span className='phone'>
                        <Icon name='phone' />
                        <span itemProp='telephone' content={phoneNumber}>{libString.phoneFormat(phoneNumber)}</span>
                    </span>
                )
                : null
            }
        </address>
    );
};


export default Address;
