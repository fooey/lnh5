import _ from 'lodash';


export default class Survey {
    constructor(props) {
        this.totalWeightedHealthSurveyScore = getAggregates(props, 'total_weighted_health_survey_score');
        this.numberOfFacilityReportedIncidents = getAggregates(props, 'number_of_facility_reported_incidents');
        this.numberOfSubstantiatedComplaints = getAggregates(props, 'number_of_substantiated_complaints');
        this.numberOfFines = getAggregates(props, 'number_of_fines');
        this.totalAmountOfFinesInDollars = getAggregates(props, 'total_amount_of_fines_in_dollars');
        this.numberOfPaymentDenials = getAggregates(props, 'number_of_payment_denials');
        this.totalNumberOfPenalties = getAggregates(props, 'total_number_of_penalties');

        this.cycles = {
            1: getCycle(props, 1),
            2: getCycle(props, 2),
            3: getCycle(props, 3),
        };
    }
}


function getAggregates(props, key) {
    return {
        avg: _.get(props, [`${key}_avg`]),
        sum: _.get(props, [`${key}_sum`]),
        min: _.get(props, [`${key}_min`]),
        max: _.get(props, [`${key}_max`]),
        rank: _.get(props, [`${key}_rank`]),
    };
}

function getCycle(props, cycle) {
    return {
        totalNumberOfHealthDeficiencies: getAggregates(props, `cycle_${cycle}_total_number_of_health_deficiencies`),
        numberOfStandardHealthDeficiencies: getAggregates(props, `cycle_${cycle}_number_of_standard_health_deficiencies`),
        numberOfComplaintHealthDeficiencies: getAggregates(props, `cycle_${cycle}_number_of_complaint_health_deficiencies`),
        healthDeficiencyScore: getAggregates(props, `cycle_${cycle}_health_deficiency_score`),
        standardSurveyHealthDate: getAggregates(props, `cycle_${cycle}_standard_survey_health_date`),
        numberOfHealthRevisits: getAggregates(props, `cycle_${cycle}_number_of_health_revisits`),
        healthRevisitScore: getAggregates(props, `cycle_${cycle}_health_revisit_score`),
        totalHealthScore: getAggregates(props, `cycle_${cycle}_total_health_score`),
    };
}
