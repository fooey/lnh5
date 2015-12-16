import nav from 'lib/nav';
import * as libString from 'lib/string';
import * as libDict from 'lib/dict';


import Nation from 'classes/geo/nation';
import State from 'classes/geo/state';
import County from 'classes/geo/county';
import City from 'classes/geo/city';
import Zipcode from 'classes/geo/zipcode';


export default class Home {
    constructor(props) {
        this.provnum = props.provnum;
        this.name = libString.toTitleCase(props.name);
        this.slug = props.slug;

        this.nation = getNation.call(this, props);
        this.state = getState.call(this, props);
        this.county = getCounty.call(this, props);
        this.city = getCity.call(this, props);
        this.zipcode = getZipcode.call(this, props);

        this.phoneNumber = props.phone_number;
        this.street = libString.toTitleCase(props.street);

        this.weightedScore = props.weighted_score;
        this.weightedScoreRank = props.weighted_score_rank;
        this.weightedScoreRankPct = props.weighted_score_rank_pct;

        this.ratings = {
            overall: {
                label: 'Overall',
                link: this.getLink('inspection'),
                score: props.overall,
                footnote: libDict.getFootnote(props.overall_footnote_id),
            },
            healthInspection: {
                label: 'Health Inspection',
                link: this.getLink('deficiencies'),
                score: props.health_inspection,
                footnote: libDict.getFootnote(props.health_inspection_footnote_id),
            },
            qualityMeasures: {
                label: 'Quality Measures',
                link: this.getLink('quality'),
                score: props.quality_measures,
                footnote: libDict.getFootnote(props.quality_measures_footnote_id),
            },
            staffing: {
                label: 'Staffing',
                link: this.getLink('staffing'),
                score: props.staffing,
                footnote: libDict.getFootnote(props.staffing_footnote_id),
            },
            staffingRn: {
                label: 'Staffing - RN Only',
                link: this.getLink('staffing'),
                score: props.staffing_rn,
                footnote: libDict.getFootnote(props.staffing_rn_footnote_id),
            },
            staffingReported: {
                label: 'Staffing - Reported',
                link: this.getLink('staffing'),
                footnote: libDict.getFootnote(props.staffing_reported_footnote_id),
            },
            staffingTherapy: {
                label: 'Staffing - Therapy',
                link: this.getLink('staffing'),
                footnote: libDict.getFootnote(props.staffing_therapy_footnote_id),
            },
        };
    }



    getLink(section = 'default', options) {
        let link = [
            '', // leading slash
            'homes',
            `${this.provnum}-${this.slug}`,
        ];


        if (section === 'default' || section === '') {
            // don't append anything
        }

        // jobs
        else if (section === 'jobs') {
            link.push('jobs');
        }

        // volunteer
        else if (section === 'volunteer') {
            link.push('volunteer');
        }


        // inspection
        else if (section === 'inspection') {
            link.push('inspection');
        }
        else if (section === 'complaints') {
            link.push('inspection', 'complaints');
        }
        else if (section === 'deficiencies') {
            link.push('inspection', 'deficiencies');
        }
        else if (section === 'quality') {
            link.push('inspection', 'quality');
        }
        else if (section === 'staffing') {
            link.push('inspection', 'staffing');
        }
        else if (section === 'owners') {
            link.push('inspection', 'owners');
        }
        else if (section === 'penalties') {
            link.push('inspection', 'penalties');
        }


        // reviews
        else if (section === 'reviews') {
            link.push('reviews');
        }
        else if (section === 'review') {
            link.push('reviews', options.reviewId);
        }
        else if (section === 'submitReview' || section === 'submitRating') {
            link.push('reviews', 'submit');
        }
        else if (section === 'rss') {
            link.push('reviews.rss');
        }
        else if (section === 'replies') {
            link.push('reviews', options.reviewId, 'replies');
        }
        else if (section === 'reply') {
            link.push('reviews', options.reviewId, 'replies', options.replyId);
        }
        else if (section === 'submitReply') {
            link.push('reviews', options.reviewId, 'replies', 'submit');
        }


        else {
            throw new Error(`Invalid section for getLink(): '${section}'`);
        }


        return link.join('/');
    }



    getLinkCanonical(section, options) {
        return nav.getLinkCanonical() + this.getLink(section, options);
    }
}



function getNation(props) {
    return new Nation({
        num: props.nation_num,
    });
}



function getState(props) {
    return new State({
        id: props.state_id,
        name: props.state_name,
        abbr: props.state_abbr,
        slug: props.state_slug,
        num: props.state_num,
    });
}


function getCounty(props) {
    return new County({
        state: this.state,
        id: props.county_id,
        name: props.county_name,
        slug: props.county_slug,
        num: props.county_num,
    });
}


function getCity(props) {
    return new City({
        state: this.state,
        county: this.county,
        id: props.city_id,
        name: props.city_name,
        slug: props.city_slug,
        num: props.city_num,
    });
}


function getZipcode(props) {
    return new Zipcode({
        state: this.state,
        county: this.county,
        city: this.city,
        zipcode: props.zipcode,
        num: props.zipcode_num,
    });
}