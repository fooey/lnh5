import _ from 'lodash';


export default class Survey {
    constructor(props) {
        this.totalWeightedHealthSurveyScore = getObj(props, 'total_weighted_health_survey_score');
        this.numberOfFacilityReportedIncidents = getObj(props, 'number_of_facility_reported_incidents');
        this.numberOfSubstantiatedComplaints = getObj(props, 'number_of_substantiated_complaints');
        this.numberOfFines = getObj(props, 'number_of_fines');
        this.totalAmountOfFinesInDollars = getObj(props, 'total_amount_of_fines_in_dollars');
        this.numberOfPaymentDenials = getObj(props, 'number_of_payment_denials');
        this.totalNumberOfPenalties = getObj(props, 'total_number_of_penalties');

        this.cycles = {
            1: getCycle(props, '1'),
            2: getCycle(props, '2'),
            3: getCycle(props, '3'),
        };
    }
}


function getObj(props, key) {
    return {
        val: _.get(props, key),
        rank: {
            nation: _.get(props, key + '_rank_nation'),
            state: _.get(props, key + '_rank_state'),
            county: _.get(props, key + '_rank_county'),
            city: _.get(props, key + '_rank_city'),
        },
    };
}


function getCycle(props, cycle) {
    return {
        standardSurveyHealthDate: props[`cycle_${cycle}_standard_survey_health_date`],

        totalNumberOfHealthDeficiencies: getObj(props, `cycle_${cycle}_total_number_of_health_deficiencies`),
        numberOfStandardHealthDeficiencies: getObj(props, `cycle_${cycle}_number_of_standard_health_deficiencies`),
        numberOfComplaintHealthDeficiencies: getObj(props, `cycle_${cycle}_number_of_complaint_health_deficiencies`),
        healthDeficiencyScore: getObj(props, `cycle_${cycle}_health_deficiency_score`),
        numberOfHealthRevisits: getObj(props, `cycle_${cycle}_number_of_health_revisits`),
        healthRevisitScore: getObj(props, `cycle_${cycle}_health_revisit_score`),
        totalHealthScore: getObj(props, `cycle_${cycle}_total_health_score`),
    };
}
