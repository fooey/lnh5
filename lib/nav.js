'use strict';

import {stringify} from 'querystring';



function getLinkCanonical(section) {
    return 'http://local-nursing-homes.com' + getLink(section);
}



function getQueryString(params = {}) {
    return (Object.keys(params).length > 0)
        ? `?${stringify(params)}`
        : '';
}


function getLink(section = 'default', params={}) {
    let link = ['']; // leading slash
    let qs = getQueryString(params);

    if (section === 'homes') {
        link.push('homes');
    }
    else if (section === 'directory') {
        link.push('directory');
    }
    else if (section === 'jobs') {
        link.push('jobs' + qs);
    }
    else if (section === 'volunteer') {
        link.push('volunteer' + qs);
    }
    else if (section === 'reviews') {
        link.push('reviews' + qs);
    }

    return link.join('/');
}



function getHomeLink(
    provnum,
    slug,
    section = 'default',
    options,
) {
    let link = [
        '', // leading slash
        'homes',
        `${provnum}-${slug}`,
    ];

    if (section === 'jobs') {
        link.push('jobs');
    }
    else if (section === 'reviews') {
        link.push('reviews');
    }
    else if (section === 'review') {
        link.push('reviews', options.id);
    }
    else if (section === 'rss') {
        link.push('reviews.rss');
    }
    else if (section === 'volunteer') {
        link.push('volunteer');
    }
    else if (section === 'inspection') {
        link.push('inspection');
    }
    else if (section === 'staffing') {
        link.push('inspection', 'staffing');
    }
    else if (section === 'quality') {
        link.push('inspection', 'quality');
    }
    else if (section === 'deficiencies') {
        link.push('inspection', 'deficiencies');
    }
    else if (section === 'complaints') {
        link.push('inspection', 'complaints');
    }

    return link.join('/');
}


function getHomeLinkCanonical(
    provnum,
    slug,
    section = 'default',
    options,
) {
    return getLinkCanonical() + getHomeLink.apply(null, arguments);
}




export default {
    getQueryString,

    getLink,
    getLinkCanonical,

    getHomeLink,
    getHomeLinkCanonical,
};
