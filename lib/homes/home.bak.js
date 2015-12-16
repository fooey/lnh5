
/*
import nav from 'lib/nav';
import * as libString from 'lib/string';
import * as libDict from 'lib/dict';

import State from 'lib/geo/state';
import County from 'lib/geo/county';
import City from 'lib/geo/city';
import Zipcode from 'lib/geo/zipcode';


export default class Home {
    constructor(props) {
        this.provnum = props.provnum;
        this.name = libString.toTitleCase(props.name);
        this.slug = props.slug;

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



export class AggRatings {
    constructor(props) {
        this.numRatings = props.num_ratings;
        this.numReviews = props.num_reviews;
        this.avgRating = props.avg_rating;
        this.avgReview = props.avg_review;
    }
}



export class Extras {
    constructor(props) {
        this.initialDate = props.initial_date;
        this.legalName = props.legal_name;
        this.ownershipType = libDict.getOwnershipType(props.ownership_type_id);
        this.sprinklerStatus = libDict.getSprinklerStatus(props.sprinkler_status_id);
        this.numBeds = props.num_beds;
        this.numResidents = props.num_residents;
        this.isMedicare = props.is_medicare;
        this.isMedicaid = props.is_medicaid;
        this.inHospital = props.in_hospital;
        this.isCCRC = props.is_ccrc;
        this.isSFF = props.is_sff;
        this.newOwner = props.new_owner;
        this.hasResidentCouncil = props.has_resident_council;
        this.hasFamilyCouncil = props.has_family_council;
    }
}



export class Survey {
    constructor(props) {
        this.totalWeightedHealthSurveyScore = props.total_weighted_health_survey_score;
        this.numberOfFacilityReportedIncidents = props.number_of_facility_reported_incidents;
        this.numberOfSubstantiatedComplaints = props.number_of_substantiated_complaints;
        this.numberOfFines = props.number_of_fines;
        this.totalAmountOfFinesInDollars = props.total_amount_of_fines_in_dollars;
        this.numberOfPaymentDenials = props.number_of_payment_denials;
        this.totalNumberOfPenalties = props.total_number_of_penalties;

        this.cycles = {
            1: {
                totalNumberOfHealthDeficiencies: props.cycle_1_total_number_of_health_deficiencies,
                numberOfStandardHealthDeficiencies: props.cycle_1_number_of_standard_health_deficiencies,
                numberOfComplaintHealthDeficiencies: props.cycle_1_number_of_complaint_health_deficiencies,
                healthDeficiencyScore: props.cycle_1_health_deficiency_score,
                standardSurveyHealthDate: props.cycle_1_standard_survey_health_date,
                numberOfHealthRevisits: props.cycle_1_number_of_health_revisits,
                healthRevisitScore: props.cycle_1_health_revisit_score,
                totalHealthScore: props.cycle_1_total_health_score,
            },
            2: {
                totalNumberOfHealthDeficiencies: props.cycle_2_total_number_of_health_deficiencies,
                numberOfStandardHealthDeficiencies: props.cycle_2_number_of_standard_health_deficiencies,
                numberOfComplaintHealthDeficiencies: props.cycle_2_number_of_complaint_health_deficiencies,
                healthDeficiencyScore: props.cycle_2_health_deficiency_score,
                standardSurveyHealthDate: props.cycle_2_standard_survey_health_date,
                numberOfHealthRevisits: props.cycle_2_number_of_health_revisits,
                healthRevisitScore: props.cycle_2_health_revisit_score,
                totalHealthScore: props.cycle_2_total_health_score,
            },
            3: {
                totalNumberOfHealthDeficiencies: props.cycle_3_total_number_of_health_deficiencies,
                numberOfStandardHealthDeficiencies: props.cycle_3_number_of_standard_health_deficiencies,
                numberOfComplaintHealthDeficiencies: props.cycle_3_number_of_complaint_health_deficiencies,
                healthDeficiencyScore: props.cycle_3_health_deficiency_score,
                standardSurveyHealthDate: props.cycle_3_standard_survey_health_date,
                numberOfHealthRevisits: props.cycle_3_number_of_health_revisits,
                healthRevisitScore: props.cycle_3_health_revisit_score,
                totalHealthScore: props.cycle_3_total_health_score,
            },
        };
    }
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

*/