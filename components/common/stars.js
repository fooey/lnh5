import React from 'react';
import classnames from 'classnames';

import {isNumeric} from 'lib/num';
import * as libRatings from 'lib/ratings';

import Icon from 'components/common/icon';



export default ({
    num,
    numMax = 5,
    className = '',
    supressRatingGroup = false,
}) => {
    const icons = getIcons(num, numMax);

    const wrapperClass = classnames(
        'stars',
        supressRatingGroup ? '' : libRatings.getRatingClass(num),
        ...className,
    );

    return (
        <span className={wrapperClass}>
            {icons.map((v, i) =>
                <span key={i} className={`star`}>
                    <Icon name={v} />
                </span>
            )}
        </span>
    );
};





function getIcons(num, numMax = 5) {
    let icons = [];

    for (let i = 1; i <= numMax; i++) {
        if (!isNumeric(num)) {
            icons.push('ban');
        }
        else if (num >= i) {
            icons.push('star');
        }
        else if (num >= i - 0.5) {
            icons.push('star-half-o');
        }
        else {
            icons.push('star-o');
        }
    }

    return icons;
}
