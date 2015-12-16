import React from 'react';
import classnames from 'classnames';

import Icon from 'components/common/icon';

export default ({
    label,
    title = label,
    href,
    position,
    icon,
    active = false,
}) => {
    const crumbClass = classnames({
        active: active,
    });

    return (
        <li
            itemProp='itemListElement'
            itemScope='true'
            itemType='http://schema.org/ListItem'
            className={crumbClass}
        >

            <meta itemProp='position' content={position} />

            {position > 1 ? <Icon name='angle-right' /> : null }

            <a
                itemProp='item'
                href={href} >

                <span itemProp='name' title={title}>
                    {icon ? <Icon name={icon} /> : null}
                    {label}
                </span>

            </a>

        </li>
    );

};
