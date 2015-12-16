'use strict';

import nav from 'lib/nav';



export default class Zipcode {
    constructor(props) {
        this.id = props.zip_id;
        this.stateId = props.state_id;
        this.countyId = props.county_id;
        this.cityId = props.city_id;

        this.zipcode = props.zipcode;
        this.slug = props.zipcode;
        this.num = props.num;

        this.isRankable = this.num >= 3;

        this.placeName = `${this.zipcode} Zip Code`;
    }



    getLink(section = 'directory', params = {}) {
        let link = [
            nav.getLink(section),
            `${this.slug}-zipcode`,
        ];

        return link.join('/') + nav.getQueryString(params);
    }



    getLinkCanonical(section = 'directory') {
        return nav.getLinkCanonical() + this.getLink(section);
    }
}