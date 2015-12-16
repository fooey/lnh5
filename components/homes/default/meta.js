
const LINK_SECTION = 'default';



export function getPageUrl(home) {
    return home.getLink(LINK_SECTION);
}



export function getCrumbs(home) {
    let crumbs = [
        {label: 'Home', href: '/', icon: 'home'},
        {label: 'Directory', href: '/directory'},
    ];


    if (home) {

        if (home.state) {
            crumbs.push({label: home.state.name, title: home.state.placeName, href: home.state.getLink()});
        }
        if (home.city) {
            crumbs.push({label: home.city.name, title: home.city.placeName, href: home.city.getLink()});
        }

        crumbs.push({label: home.name, href: home.getLink(LINK_SECTION)});
    }

    return crumbs;
}



export function getHead(home) {
    return {
        title: home ? home.name : 'error',
        metas: getMeta(home),
        links: [],
    };
}



export function getMeta(home) {
    if (!home) {
        return [];
    }

    return [{
        name: 'description',
        content: `Ratings and reviews, job openings, inspection results, training programs and more for ${home.name}, a 4 star rated nursing home located in Birmingham.`,
        itemProp: 'description',
    }, {
        rel: 'canonical',
        href: home.getLinkCanonical(LINK_SECTION),
        itemProp: 'url',
    }, {
        rel: 'alternate',
        type: 'application/rss+xml',
        href: home.getLinkCanonical('rss'),
    }];
}