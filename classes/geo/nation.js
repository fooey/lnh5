'use strict';

import nav from 'lib/nav';



export default class State {
    constructor(props) {
        this.num = props.num;
        this.isRankable = true;

        this.name = 'Nation';
        this.placeName = 'U.S.A.';
    }



    getLink(section = 'directory', params = {}) {
        let link = [
            nav.getLink(section),
        ];

        return link.join('/') + nav.getQueryString(params);
    }



    getLinkCanonical(section = 'directory') {
        return nav.getLinkCanonical() + this.getLink(section);
    }
}