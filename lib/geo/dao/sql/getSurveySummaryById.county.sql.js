export default `
SELECT
    state_id
    , county_id
    , total_weighted_health_survey_score_avg
    , total_weighted_health_survey_score_sum
    , total_weighted_health_survey_score_min
    , total_weighted_health_survey_score_max
    , total_weighted_health_survey_score_rank
    , number_of_facility_reported_incidents_avg
    , number_of_facility_reported_incidents_sum
    , number_of_facility_reported_incidents_min
    , number_of_facility_reported_incidents_max
    , number_of_facility_reported_incidents_rank
    , number_of_substantiated_complaints_avg
    , number_of_substantiated_complaints_sum
    , number_of_substantiated_complaints_min
    , number_of_substantiated_complaints_max
    , number_of_substantiated_complaints_rank
    , number_of_fines_avg
    , number_of_fines_sum
    , number_of_fines_min
    , number_of_fines_max
    , number_of_fines_rank
    , total_amount_of_fines_in_dollars_avg
    , total_amount_of_fines_in_dollars_sum
    , total_amount_of_fines_in_dollars_min
    , total_amount_of_fines_in_dollars_max
    , total_amount_of_fines_in_dollars_rank
    , number_of_payment_denials_avg
    , number_of_payment_denials_sum
    , number_of_payment_denials_min
    , number_of_payment_denials_max
    , number_of_payment_denials_rank
    , total_number_of_penalties_avg
    , total_number_of_penalties_sum
    , total_number_of_penalties_min
    , total_number_of_penalties_max
    , total_number_of_penalties_rank
    , cycle_1_total_number_of_health_deficiencies_avg
    , cycle_1_total_number_of_health_deficiencies_sum
    , cycle_1_total_number_of_health_deficiencies_min
    , cycle_1_total_number_of_health_deficiencies_max
    , cycle_1_total_number_of_health_deficiencies_rank
    , cycle_1_number_of_standard_health_deficiencies_avg
    , cycle_1_number_of_standard_health_deficiencies_sum
    , cycle_1_number_of_standard_health_deficiencies_min
    , cycle_1_number_of_standard_health_deficiencies_max
    , cycle_1_number_of_standard_health_deficiencies_rank
    , cycle_1_number_of_complaint_health_deficiencies_avg
    , cycle_1_number_of_complaint_health_deficiencies_sum
    , cycle_1_number_of_complaint_health_deficiencies_min
    , cycle_1_number_of_complaint_health_deficiencies_max
    , cycle_1_number_of_complaint_health_deficiencies_rank
    , cycle_1_health_deficiency_score_avg
    , cycle_1_health_deficiency_score_sum
    , cycle_1_health_deficiency_score_min
    , cycle_1_health_deficiency_score_max
    , cycle_1_health_deficiency_score_rank
    , cycle_1_number_of_health_revisits_avg
    , cycle_1_number_of_health_revisits_sum
    , cycle_1_number_of_health_revisits_min
    , cycle_1_number_of_health_revisits_max
    , cycle_1_number_of_health_revisits_rank
    , cycle_1_health_revisit_score_avg
    , cycle_1_health_revisit_score_sum
    , cycle_1_health_revisit_score_min
    , cycle_1_health_revisit_score_max
    , cycle_1_health_revisit_score_rank
    , cycle_1_total_health_score_avg
    , cycle_1_total_health_score_sum
    , cycle_1_total_health_score_min
    , cycle_1_total_health_score_max
    , cycle_1_total_health_score_rank
    , cycle_2_total_number_of_health_deficiencies_avg
    , cycle_2_total_number_of_health_deficiencies_sum
    , cycle_2_total_number_of_health_deficiencies_min
    , cycle_2_total_number_of_health_deficiencies_max
    , cycle_2_total_number_of_health_deficiencies_rank
    , cycle_2_number_of_standard_health_deficiencies_avg
    , cycle_2_number_of_standard_health_deficiencies_sum
    , cycle_2_number_of_standard_health_deficiencies_min
    , cycle_2_number_of_standard_health_deficiencies_max
    , cycle_2_number_of_standard_health_deficiencies_rank
    , cycle_2_number_of_complaint_health_deficiencies_avg
    , cycle_2_number_of_complaint_health_deficiencies_sum
    , cycle_2_number_of_complaint_health_deficiencies_min
    , cycle_2_number_of_complaint_health_deficiencies_max
    , cycle_2_number_of_complaint_health_deficiencies_rank
    , cycle_2_health_deficiency_score_avg
    , cycle_2_health_deficiency_score_sum
    , cycle_2_health_deficiency_score_min
    , cycle_2_health_deficiency_score_max
    , cycle_2_health_deficiency_score_rank
    , cycle_2_number_of_health_revisits_avg
    , cycle_2_number_of_health_revisits_sum
    , cycle_2_number_of_health_revisits_min
    , cycle_2_number_of_health_revisits_max
    , cycle_2_number_of_health_revisits_rank
    , cycle_2_health_revisit_score_avg
    , cycle_2_health_revisit_score_sum
    , cycle_2_health_revisit_score_min
    , cycle_2_health_revisit_score_max
    , cycle_2_health_revisit_score_rank
    , cycle_2_total_health_score_avg
    , cycle_2_total_health_score_sum
    , cycle_2_total_health_score_min
    , cycle_2_total_health_score_max
    , cycle_2_total_health_score_rank
    , cycle_3_total_number_of_health_deficiencies_avg
    , cycle_3_total_number_of_health_deficiencies_sum
    , cycle_3_total_number_of_health_deficiencies_min
    , cycle_3_total_number_of_health_deficiencies_max
    , cycle_3_total_number_of_health_deficiencies_rank
    , cycle_3_number_of_standard_health_deficiencies_avg
    , cycle_3_number_of_standard_health_deficiencies_sum
    , cycle_3_number_of_standard_health_deficiencies_min
    , cycle_3_number_of_standard_health_deficiencies_max
    , cycle_3_number_of_standard_health_deficiencies_rank
    , cycle_3_number_of_complaint_health_deficiencies_avg
    , cycle_3_number_of_complaint_health_deficiencies_sum
    , cycle_3_number_of_complaint_health_deficiencies_min
    , cycle_3_number_of_complaint_health_deficiencies_max
    , cycle_3_number_of_complaint_health_deficiencies_rank
    , cycle_3_health_deficiency_score_avg
    , cycle_3_health_deficiency_score_sum
    , cycle_3_health_deficiency_score_min
    , cycle_3_health_deficiency_score_max
    , cycle_3_health_deficiency_score_rank
    , cycle_3_number_of_health_revisits_avg
    , cycle_3_number_of_health_revisits_sum
    , cycle_3_number_of_health_revisits_min
    , cycle_3_number_of_health_revisits_max
    , cycle_3_number_of_health_revisits_rank
    , cycle_3_health_revisit_score_avg
    , cycle_3_health_revisit_score_sum
    , cycle_3_health_revisit_score_min
    , cycle_3_health_revisit_score_max
    , cycle_3_health_revisit_score_rank
    , cycle_3_total_health_score_avg
    , cycle_3_total_health_score_sum
    , cycle_3_total_health_score_min
    , cycle_3_total_health_score_max
    , cycle_3_total_health_score_rank
FROM summary.survey_county
WHERE state_id = $1::int
    AND county_id = $2::int;
`;