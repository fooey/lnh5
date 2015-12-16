'use strict';

import nav from 'lib/nav';



export default class City {
    constructor(props) {
        this.state = props.state;
        this.county = props.county;

        this.id = props.id;
        this.name = props.name;
        this.slug = props.slug;
        this.num = props.num;

        this.isRankable = this.num >= 3;

        this.placeName = `${this.name}, ${this.state.abbr}`;
    }



    getLink(section = 'directory', params = {}) {
        let link = [
            this.state.getLink(section),
            this.slug,
        ];

        return link.join('/') + nav.getQueryString(params);
    }



    getLinkCanonical(section = 'directory') {
        return nav.getLinkCanonical() + this.getLink(section);
    }
}