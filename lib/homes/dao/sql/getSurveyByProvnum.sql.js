export default `
SELECT
    provnum

    , total_weighted_health_survey_score
    , total_weighted_health_survey_score_rank_nation
    , total_weighted_health_survey_score_rank_state
    , total_weighted_health_survey_score_rank_county
    , total_weighted_health_survey_score_rank_city



    , number_of_facility_reported_incidents
    , number_of_facility_reported_incidents_rank_nation
    , number_of_facility_reported_incidents_rank_state
    , number_of_facility_reported_incidents_rank_county
    , number_of_facility_reported_incidents_rank_city


    , number_of_substantiated_complaints
    , number_of_substantiated_complaints_rank_nation
    , number_of_substantiated_complaints_rank_state
    , number_of_substantiated_complaints_rank_county
    , number_of_substantiated_complaints_rank_city


    , number_of_fines
    , number_of_fines_rank_nation
    , number_of_fines_rank_state
    , number_of_fines_rank_county
    , number_of_fines_rank_city


    , total_amount_of_fines_in_dollars
    , total_amount_of_fines_in_dollars_rank_nation
    , total_amount_of_fines_in_dollars_rank_state
    , total_amount_of_fines_in_dollars_rank_county
    , total_amount_of_fines_in_dollars_rank_city


    , number_of_payment_denials
    , number_of_payment_denials_rank_nation
    , number_of_payment_denials_rank_state
    , number_of_payment_denials_rank_county
    , number_of_payment_denials_rank_city


    , total_number_of_penalties
    , total_number_of_penalties_rank_nation
    , total_number_of_penalties_rank_state
    , total_number_of_penalties_rank_county
    , total_number_of_penalties_rank_city



    , cycle_1_standard_survey_health_date

    , cycle_1_total_number_of_health_deficiencies
    , cycle_1_total_number_of_health_deficiencies_rank_nation
    , cycle_1_total_number_of_health_deficiencies_rank_state
    , cycle_1_total_number_of_health_deficiencies_rank_county
    , cycle_1_total_number_of_health_deficiencies_rank_city


    , cycle_1_number_of_standard_health_deficiencies
    , cycle_1_number_of_standard_health_deficiencies_rank_nation
    , cycle_1_number_of_standard_health_deficiencies_rank_state
    , cycle_1_number_of_standard_health_deficiencies_rank_county
    , cycle_1_number_of_standard_health_deficiencies_rank_city


    , cycle_1_number_of_complaint_health_deficiencies
    , cycle_1_number_of_complaint_health_deficiencies_rank_nation
    , cycle_1_number_of_complaint_health_deficiencies_rank_state
    , cycle_1_number_of_complaint_health_deficiencies_rank_county
    , cycle_1_number_of_complaint_health_deficiencies_rank_city


    , cycle_1_health_deficiency_score
    , cycle_1_health_deficiency_score_rank_nation
    , cycle_1_health_deficiency_score_rank_state
    , cycle_1_health_deficiency_score_rank_county
    , cycle_1_health_deficiency_score_rank_city


    , cycle_1_number_of_health_revisits
    , cycle_1_number_of_health_revisits_rank_nation
    , cycle_1_number_of_health_revisits_rank_state
    , cycle_1_number_of_health_revisits_rank_county
    , cycle_1_number_of_health_revisits_rank_city


    , cycle_1_health_revisit_score
    , cycle_1_health_revisit_score_rank_nation
    , cycle_1_health_revisit_score_rank_state
    , cycle_1_health_revisit_score_rank_county
    , cycle_1_health_revisit_score_rank_city


    , cycle_1_total_health_score
    , cycle_1_total_health_score_rank_nation
    , cycle_1_total_health_score_rank_state
    , cycle_1_total_health_score_rank_county
    , cycle_1_total_health_score_rank_city



    , cycle_2_standard_health_survey_date

    , cycle_2_total_number_of_health_deficiencies
    , cycle_2_total_number_of_health_deficiencies_rank_nation
    , cycle_2_total_number_of_health_deficiencies_rank_state
    , cycle_2_total_number_of_health_deficiencies_rank_county
    , cycle_2_total_number_of_health_deficiencies_rank_city


    , cycle_2_number_of_standard_health_deficiencies
    , cycle_2_number_of_standard_health_deficiencies_rank_nation
    , cycle_2_number_of_standard_health_deficiencies_rank_state
    , cycle_2_number_of_standard_health_deficiencies_rank_county
    , cycle_2_number_of_standard_health_deficiencies_rank_city


    , cycle_2_number_of_complaint_health_deficiencies
    , cycle_2_number_of_complaint_health_deficiencies_rank_nation
    , cycle_2_number_of_complaint_health_deficiencies_rank_state
    , cycle_2_number_of_complaint_health_deficiencies_rank_county
    , cycle_2_number_of_complaint_health_deficiencies_rank_city


    , cycle_2_health_deficiency_score
    , cycle_2_health_deficiency_score_rank_nation
    , cycle_2_health_deficiency_score_rank_state
    , cycle_2_health_deficiency_score_rank_county
    , cycle_2_health_deficiency_score_rank_city


    , cycle_2_number_of_health_revisits
    , cycle_2_number_of_health_revisits_rank_nation
    , cycle_2_number_of_health_revisits_rank_state
    , cycle_2_number_of_health_revisits_rank_county
    , cycle_2_number_of_health_revisits_rank_city


    , cycle_2_health_revisit_score
    , cycle_2_health_revisit_score_rank_nation
    , cycle_2_health_revisit_score_rank_state
    , cycle_2_health_revisit_score_rank_county
    , cycle_2_health_revisit_score_rank_city


    , cycle_2_total_health_score
    , cycle_2_total_health_score_rank_nation
    , cycle_2_total_health_score_rank_state
    , cycle_2_total_health_score_rank_county
    , cycle_2_total_health_score_rank_city



    , cycle_3_standard_health_survey_date

    , cycle_3_total_number_of_health_deficiencies
    , cycle_3_total_number_of_health_deficiencies_rank_nation
    , cycle_3_total_number_of_health_deficiencies_rank_state
    , cycle_3_total_number_of_health_deficiencies_rank_county
    , cycle_3_total_number_of_health_deficiencies_rank_city


    , cycle_3_number_of_standard_health_deficiencies
    , cycle_3_number_of_standard_health_deficiencies_rank_nation
    , cycle_3_number_of_standard_health_deficiencies_rank_state
    , cycle_3_number_of_standard_health_deficiencies_rank_county
    , cycle_3_number_of_standard_health_deficiencies_rank_city


    , cycle_3_number_of_complaint_health_deficiencies
    , cycle_3_number_of_complaint_health_deficiencies_rank_nation
    , cycle_3_number_of_complaint_health_deficiencies_rank_state
    , cycle_3_number_of_complaint_health_deficiencies_rank_county
    , cycle_3_number_of_complaint_health_deficiencies_rank_city


    , cycle_3_health_deficiency_score
    , cycle_3_health_deficiency_score_rank_nation
    , cycle_3_health_deficiency_score_rank_state
    , cycle_3_health_deficiency_score_rank_county
    , cycle_3_health_deficiency_score_rank_city


    , cycle_3_number_of_health_revisits
    , cycle_3_number_of_health_revisits_rank_nation
    , cycle_3_number_of_health_revisits_rank_state
    , cycle_3_number_of_health_revisits_rank_county
    , cycle_3_number_of_health_revisits_rank_city


    , cycle_3_health_revisit_score
    , cycle_3_health_revisit_score_rank_nation
    , cycle_3_health_revisit_score_rank_state
    , cycle_3_health_revisit_score_rank_county
    , cycle_3_health_revisit_score_rank_city


    , cycle_3_total_health_score
    , cycle_3_total_health_score_rank_nation
    , cycle_3_total_health_score_rank_state
    , cycle_3_total_health_score_rank_county
    , cycle_3_total_health_score_rank_city


FROM survey
WHERE provnum = $1::text
    AND 1 = 1;
`;