import React from 'react';

export default ({name, ...props}) => {
    const iconClasses = `fa-${name.split(' ').join(' fa-')}`;

    return <i className={`fa ${iconClasses}`} {...props} />;
};
