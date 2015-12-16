'use strict';

import nav from 'lib/nav';



export default class County {
    constructor(props) {
        this.state = props.state;

        this.id = props.id;
        this.name = props.name;
        this.slug = props.slug;
        this.num = props.num;

        this.isRankable = this.num >= 3;

        this.placeName = `${this.name} ${this.getCountyVariant()}, ${this.state.abbr}`;
    }



    getLink(section = 'directory', params = {}) {
        let link = [
            this.state.getLink(section),
            `${this.slug}-county`,
        ];

        return link.join('/') + nav.getQueryString(params);
    }



    getLinkCanonical(section = 'directory') {
        return nav.getLinkCanonical() + this.getLink(section);
    }


    getCountyVariant() {
        if (this.state.name = 'Alaska') {
            return 'Borough';
        }
        else if (this.state.name = 'Louisiana') {
            return 'Parish';
        }
        else {
            return 'County';
        }
    }
}