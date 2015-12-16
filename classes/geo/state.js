'use strict';

import nav from 'lib/nav';



export default class State {
    constructor(props) {
        this.id = props.id;
        this.name = props.name;
        this.abbr = props.abbr;
        this.slug = props.slug;
        this.num = props.num;

        this.isRankable = this.num >= 3;

        this.placeName = this.name;
    }



    getLink(section = 'directory', params = {}) {
        let link = [
            nav.getLink(section),
            this.slug,
        ];

        return link.join('/') + nav.getQueryString(params);
    }



    getLinkCanonical(section = 'directory') {
        return nav.getLinkCanonical() + this.getLink(section);
    }
}