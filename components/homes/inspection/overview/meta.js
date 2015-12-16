
import * as HomeDefaultMeta from 'components/homes/default/meta';

const LINK_SECTION = 'inspection';




export function getPageUrl(home) {
    return home.getLink(LINK_SECTION);
}



export function getCrumbs(home) {
    return [
        ...HomeDefaultMeta.getCrumbs(home),
        {label: `Inspections Overview`, href: home.getLink(LINK_SECTION)},
    ];
}



export function getHead(home) {
    return {
        title: `FIXME`,
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
        content: `FIXME`,
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