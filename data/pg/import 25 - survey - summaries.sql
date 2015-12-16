/*
SELECT *
FROM survey
LIMIT 100;
*/


-- ----------------------------------------
-- 
--  POPULATE survey SUMMARIES
-- 
-- ----------------------------------------




-- summary.survey_nation
-- 
DROP TABLE IF EXISTS summary.survey_nation;

CREATE TABLE summary.survey_nation (
    total_weighted_health_survey_score_avg REAL
    , total_weighted_health_survey_score_sum REAL
    , total_weighted_health_survey_score_min REAL
    , total_weighted_health_survey_score_max REAL

    , number_of_facility_reported_incidents_avg REAL
    , number_of_facility_reported_incidents_sum REAL
    , number_of_facility_reported_incidents_min INT
    , number_of_facility_reported_incidents_max INT

    , number_of_substantiated_complaints_avg REAL
    , number_of_substantiated_complaints_sum INT
    , number_of_substantiated_complaints_min INT
    , number_of_substantiated_complaints_max INT

    , number_of_fines_avg REAL
    , number_of_fines_sum INT
    , number_of_fines_min INT
    , number_of_fines_max INT

    , total_amount_of_fines_in_dollars_avg REAL
    , total_amount_of_fines_in_dollars_sum INT
    , total_amount_of_fines_in_dollars_min INT
    , total_amount_of_fines_in_dollars_max INT

    , number_of_payment_denials_avg REAL
    , number_of_payment_denials_sum INT
    , number_of_payment_denials_min INT
    , number_of_payment_denials_max INT

    , total_number_of_penalties_avg REAL
    , total_number_of_penalties_sum INT
    , total_number_of_penalties_min INT
    , total_number_of_penalties_max INT


    , cycle_1_total_number_of_health_deficiencies_avg REAL
    , cycle_1_total_number_of_health_deficiencies_sum INT
    , cycle_1_total_number_of_health_deficiencies_min INT
    , cycle_1_total_number_of_health_deficiencies_max INT

    , cycle_1_number_of_standard_health_deficiencies_avg REAL
    , cycle_1_number_of_standard_health_deficiencies_sum INT
    , cycle_1_number_of_standard_health_deficiencies_min INT
    , cycle_1_number_of_standard_health_deficiencies_max INT

    , cycle_1_number_of_complaint_health_deficiencies_avg REAL
    , cycle_1_number_of_complaint_health_deficiencies_sum INT
    , cycle_1_number_of_complaint_health_deficiencies_min INT
    , cycle_1_number_of_complaint_health_deficiencies_max INT

    , cycle_1_health_deficiency_score_avg REAL
    , cycle_1_health_deficiency_score_sum INT
    , cycle_1_health_deficiency_score_min INT
    , cycle_1_health_deficiency_score_max INT

    , cycle_1_number_of_health_revisits_avg REAL
    , cycle_1_number_of_health_revisits_sum INT
    , cycle_1_number_of_health_revisits_min INT
    , cycle_1_number_of_health_revisits_max INT

    , cycle_1_health_revisit_score_avg REAL
    , cycle_1_health_revisit_score_sum INT
    , cycle_1_health_revisit_score_min INT
    , cycle_1_health_revisit_score_max INT

    , cycle_1_total_health_score_avg REAL
    , cycle_1_total_health_score_sum INT
    , cycle_1_total_health_score_min INT
    , cycle_1_total_health_score_max INT


    , cycle_2_total_number_of_health_deficiencies_avg REAL
    , cycle_2_total_number_of_health_deficiencies_sum INT
    , cycle_2_total_number_of_health_deficiencies_min INT
    , cycle_2_total_number_of_health_deficiencies_max INT

    , cycle_2_number_of_standard_health_deficiencies_avg REAL
    , cycle_2_number_of_standard_health_deficiencies_sum INT
    , cycle_2_number_of_standard_health_deficiencies_min INT
    , cycle_2_number_of_standard_health_deficiencies_max INT

    , cycle_2_number_of_complaint_health_deficiencies_avg REAL
    , cycle_2_number_of_complaint_health_deficiencies_sum INT
    , cycle_2_number_of_complaint_health_deficiencies_min INT
    , cycle_2_number_of_complaint_health_deficiencies_max INT

    , cycle_2_health_deficiency_score_avg REAL
    , cycle_2_health_deficiency_score_sum INT
    , cycle_2_health_deficiency_score_min INT
    , cycle_2_health_deficiency_score_max INT

    , cycle_2_number_of_health_revisits_avg REAL
    , cycle_2_number_of_health_revisits_sum INT
    , cycle_2_number_of_health_revisits_min INT
    , cycle_2_number_of_health_revisits_max INT

    , cycle_2_health_revisit_score_avg REAL
    , cycle_2_health_revisit_score_sum INT
    , cycle_2_health_revisit_score_min INT
    , cycle_2_health_revisit_score_max INT

    , cycle_2_total_health_score_avg REAL
    , cycle_2_total_health_score_sum INT
    , cycle_2_total_health_score_min INT
    , cycle_2_total_health_score_max INT


    , cycle_3_total_number_of_health_deficiencies_avg REAL
    , cycle_3_total_number_of_health_deficiencies_sum INT
    , cycle_3_total_number_of_health_deficiencies_min INT
    , cycle_3_total_number_of_health_deficiencies_max INT

    , cycle_3_number_of_standard_health_deficiencies_avg REAL
    , cycle_3_number_of_standard_health_deficiencies_sum INT
    , cycle_3_number_of_standard_health_deficiencies_min INT
    , cycle_3_number_of_standard_health_deficiencies_max INT

    , cycle_3_number_of_complaint_health_deficiencies_avg REAL
    , cycle_3_number_of_complaint_health_deficiencies_sum INT
    , cycle_3_number_of_complaint_health_deficiencies_min INT
    , cycle_3_number_of_complaint_health_deficiencies_max INT

    , cycle_3_health_deficiency_score_avg REAL
    , cycle_3_health_deficiency_score_sum INT
    , cycle_3_health_deficiency_score_min INT
    , cycle_3_health_deficiency_score_max INT

    , cycle_3_number_of_health_revisits_avg REAL
    , cycle_3_number_of_health_revisits_sum INT
    , cycle_3_number_of_health_revisits_min INT
    , cycle_3_number_of_health_revisits_max INT

    , cycle_3_health_revisit_score_avg REAL
    , cycle_3_health_revisit_score_sum INT
    , cycle_3_health_revisit_score_min INT
    , cycle_3_health_revisit_score_max INT

    , cycle_3_total_health_score_avg REAL
    , cycle_3_total_health_score_sum INT
    , cycle_3_total_health_score_min INT
    , cycle_3_total_health_score_max INT
);

INSERT INTO summary.survey_nation
SELECT
    CAST(AVG(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_avg
    , CAST(SUM(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_sum
    , CAST(MIN(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_min
    , CAST(MAX(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_max

    , CAST(AVG(number_of_facility_reported_incidents) AS REAL) AS number_of_facility_reported_incidents_avg
    , CAST(SUM(number_of_facility_reported_incidents) AS INT) AS number_of_facility_reported_incidents_sum
    , CAST(MIN(number_of_facility_reported_incidents) AS INT) AS number_of_facility_reported_incidents_min
    , CAST(MAX(number_of_facility_reported_incidents) AS INT) AS number_of_facility_reported_incidents_max

    , CAST(AVG(number_of_substantiated_complaints) AS REAL) AS number_of_substantiated_complaints_avg
    , CAST(SUM(number_of_substantiated_complaints) AS INT) AS number_of_substantiated_complaints_sum
    , CAST(MIN(number_of_substantiated_complaints) AS INT) AS number_of_substantiated_complaints_min
    , CAST(MAX(number_of_substantiated_complaints) AS INT) AS number_of_substantiated_complaints_max

    , CAST(AVG(number_of_fines) AS REAL) AS number_of_fines_avg
    , CAST(SUM(number_of_fines) AS INT) AS number_of_fines_sum
    , CAST(MIN(number_of_fines) AS INT) AS number_of_fines_min
    , CAST(MAX(number_of_fines) AS INT) AS number_of_fines_max

    , CAST(AVG(total_amount_of_fines_in_dollars) AS REAL) AS total_amount_of_fines_in_dollars_avg
    , CAST(SUM(total_amount_of_fines_in_dollars) AS INT) AS total_amount_of_fines_in_dollars_sum
    , CAST(MIN(total_amount_of_fines_in_dollars) AS INT) AS total_amount_of_fines_in_dollars_min
    , CAST(MAX(total_amount_of_fines_in_dollars) AS INT) AS total_amount_of_fines_in_dollars_max

    , CAST(AVG(number_of_payment_denials) AS REAL) AS number_of_payment_denials_avg
    , CAST(SUM(number_of_payment_denials) AS INT) AS number_of_payment_denials_sum
    , CAST(MIN(number_of_payment_denials) AS INT) AS number_of_payment_denials_min
    , CAST(MAX(number_of_payment_denials) AS INT) AS number_of_payment_denials_max

    , CAST(AVG(total_number_of_penalties) AS REAL) AS total_number_of_penalties_avg
    , CAST(SUM(total_number_of_penalties) AS INT) AS total_number_of_penalties_sum
    , CAST(MIN(total_number_of_penalties) AS INT) AS total_number_of_penalties_min
    , CAST(MAX(total_number_of_penalties) AS INT) AS total_number_of_penalties_max


    , CAST(AVG(cycle_1_total_number_of_health_deficiencies) AS REAL) AS cycle_1_total_number_of_health_deficiencies_avg
    , CAST(SUM(cycle_1_total_number_of_health_deficiencies) AS INT) AS cycle_1_total_number_of_health_deficiencies_sum
    , CAST(MIN(cycle_1_total_number_of_health_deficiencies) AS INT) AS cycle_1_total_number_of_health_deficiencies_min
    , CAST(MAX(cycle_1_total_number_of_health_deficiencies) AS INT) AS cycle_1_total_number_of_health_deficiencies_max

    , CAST(AVG(cycle_1_number_of_standard_health_deficiencies) AS REAL) AS cycle_1_number_of_standard_health_deficiencies_avg
    , CAST(SUM(cycle_1_number_of_standard_health_deficiencies) AS INT) AS cycle_1_number_of_standard_health_deficiencies_sum
    , CAST(MIN(cycle_1_number_of_standard_health_deficiencies) AS INT) AS cycle_1_number_of_standard_health_deficiencies_min
    , CAST(MAX(cycle_1_number_of_standard_health_deficiencies) AS INT) AS cycle_1_number_of_standard_health_deficiencies_max

    , CAST(AVG(cycle_1_number_of_complaint_health_deficiencies) AS REAL) AS cycle_1_number_of_complaint_health_deficiencies_avg
    , CAST(SUM(cycle_1_number_of_complaint_health_deficiencies) AS INT) AS cycle_1_number_of_complaint_health_deficiencies_sum
    , CAST(MIN(cycle_1_number_of_complaint_health_deficiencies) AS INT) AS cycle_1_number_of_complaint_health_deficiencies_min
    , CAST(MAX(cycle_1_number_of_complaint_health_deficiencies) AS INT) AS cycle_1_number_of_complaint_health_deficiencies_max

    , CAST(AVG(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_avg
    , CAST(SUM(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_sum
    , CAST(MIN(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_min
    , CAST(MAX(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_max

    , CAST(AVG(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_avg
    , CAST(SUM(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_sum
    , CAST(MIN(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_min
    , CAST(MAX(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_max

    , CAST(AVG(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_avg
    , CAST(SUM(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_sum
    , CAST(MIN(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_min
    , CAST(MAX(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_max

    , CAST(AVG(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_avg
    , CAST(SUM(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_sum
    , CAST(MIN(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_min
    , CAST(MAX(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_max


    , CAST(AVG(cycle_2_total_number_of_health_deficiencies) AS REAL) AS cycle_2_total_number_of_health_deficiencies_avg
    , CAST(SUM(cycle_2_total_number_of_health_deficiencies) AS INT) AS cycle_2_total_number_of_health_deficiencies_sum
    , CAST(MIN(cycle_2_total_number_of_health_deficiencies) AS INT) AS cycle_2_total_number_of_health_deficiencies_min
    , CAST(MAX(cycle_2_total_number_of_health_deficiencies) AS INT) AS cycle_2_total_number_of_health_deficiencies_max

    , CAST(AVG(cycle_2_number_of_standard_health_deficiencies) AS REAL) AS cycle_2_number_of_standard_health_deficiencies_avg
    , CAST(SUM(cycle_2_number_of_standard_health_deficiencies) AS INT) AS cycle_2_number_of_standard_health_deficiencies_sum
    , CAST(MIN(cycle_2_number_of_standard_health_deficiencies) AS INT) AS cycle_2_number_of_standard_health_deficiencies_min
    , CAST(MAX(cycle_2_number_of_standard_health_deficiencies) AS INT) AS cycle_2_number_of_standard_health_deficiencies_max

    , CAST(AVG(cycle_2_number_of_complaint_health_deficiencies) AS REAL) AS cycle_2_number_of_complaint_health_deficiencies_avg
    , CAST(SUM(cycle_2_number_of_complaint_health_deficiencies) AS INT) AS cycle_2_number_of_complaint_health_deficiencies_sum
    , CAST(MIN(cycle_2_number_of_complaint_health_deficiencies) AS INT) AS cycle_2_number_of_complaint_health_deficiencies_min
    , CAST(MAX(cycle_2_number_of_complaint_health_deficiencies) AS INT) AS cycle_2_number_of_complaint_health_deficiencies_max

    , CAST(AVG(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_avg
    , CAST(SUM(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_sum
    , CAST(MIN(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_min
    , CAST(MAX(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_max

    , CAST(AVG(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_avg
    , CAST(SUM(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_sum
    , CAST(MIN(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_min
    , CAST(MAX(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_max

    , CAST(AVG(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_avg
    , CAST(SUM(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_sum
    , CAST(MIN(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_min
    , CAST(MAX(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_max

    , CAST(AVG(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_avg
    , CAST(SUM(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_sum
    , CAST(MIN(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_min
    , CAST(MAX(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_max


    , CAST(AVG(cycle_3_total_number_of_health_deficiencies) AS REAL) AS cycle_3_total_number_of_health_deficiencies_avg
    , CAST(SUM(cycle_3_total_number_of_health_deficiencies) AS INT) AS cycle_3_total_number_of_health_deficiencies_sum
    , CAST(MIN(cycle_3_total_number_of_health_deficiencies) AS INT) AS cycle_3_total_number_of_health_deficiencies_min
    , CAST(MAX(cycle_3_total_number_of_health_deficiencies) AS INT) AS cycle_3_total_number_of_health_deficiencies_max

    , CAST(AVG(cycle_3_number_of_standard_health_deficiencies) AS REAL) AS cycle_3_number_of_standard_health_deficiencies_avg
    , CAST(SUM(cycle_3_number_of_standard_health_deficiencies) AS INT) AS cycle_3_number_of_standard_health_deficiencies_sum
    , CAST(MIN(cycle_3_number_of_standard_health_deficiencies) AS INT) AS cycle_3_number_of_standard_health_deficiencies_min
    , CAST(MAX(cycle_3_number_of_standard_health_deficiencies) AS INT) AS cycle_3_number_of_standard_health_deficiencies_max

    , CAST(AVG(cycle_3_number_of_complaint_health_deficiencies) AS REAL) AS cycle_3_number_of_complaint_health_deficiencies_avg
    , CAST(SUM(cycle_3_number_of_complaint_health_deficiencies) AS INT) AS cycle_3_number_of_complaint_health_deficiencies_sum
    , CAST(MIN(cycle_3_number_of_complaint_health_deficiencies) AS INT) AS cycle_3_number_of_complaint_health_deficiencies_min
    , CAST(MAX(cycle_3_number_of_complaint_health_deficiencies) AS INT) AS cycle_3_number_of_complaint_health_deficiencies_max

    , CAST(AVG(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_avg
    , CAST(SUM(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_sum
    , CAST(MIN(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_min
    , CAST(MAX(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_max

    , CAST(AVG(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_avg
    , CAST(SUM(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_sum
    , CAST(MIN(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_min
    , CAST(MAX(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_max

    , CAST(AVG(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_avg
    , CAST(SUM(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_sum
    , CAST(MIN(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_min
    , CAST(MAX(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_max

    , CAST(AVG(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_avg
    , CAST(SUM(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_sum
    , CAST(MIN(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_min
    , CAST(MAX(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_max

FROM public.survey;






-- summary.survey_state

DROP TABLE IF EXISTS summary.survey_state;
 
CREATE TABLE summary.survey_state (
    state_id INT

    , total_weighted_health_survey_score_avg REAL
    , total_weighted_health_survey_score_sum REAL
    , total_weighted_health_survey_score_min REAL
    , total_weighted_health_survey_score_max REAL
    , total_weighted_health_survey_score_rank REAL

    , number_of_facility_reported_incidents_avg REAL
    , number_of_facility_reported_incidents_sum REAL
    , number_of_facility_reported_incidents_min INT
    , number_of_facility_reported_incidents_max INT
    , number_of_facility_reported_incidents_rank REAL

    , number_of_substantiated_complaints_avg REAL
    , number_of_substantiated_complaints_sum INT
    , number_of_substantiated_complaints_min INT
    , number_of_substantiated_complaints_max INT
    , number_of_substantiated_complaints_rank REAL

    , number_of_fines_avg REAL
    , number_of_fines_sum INT
    , number_of_fines_min INT
    , number_of_fines_max INT
    , number_of_fines_rank REAL

    , total_amount_of_fines_in_dollars_avg REAL
    , total_amount_of_fines_in_dollars_sum INT
    , total_amount_of_fines_in_dollars_min INT
    , total_amount_of_fines_in_dollars_max INT
    , total_amount_of_fines_in_dollars_rank REAL

    , number_of_payment_denials_avg REAL
    , number_of_payment_denials_sum INT
    , number_of_payment_denials_min INT
    , number_of_payment_denials_max INT
    , number_of_payment_denials_rank REAL

    , total_number_of_penalties_avg REAL
    , total_number_of_penalties_sum INT
    , total_number_of_penalties_min INT
    , total_number_of_penalties_max INT
    , total_number_of_penalties_rank REAL


    , cycle_1_total_number_of_health_deficiencies_avg REAL
    , cycle_1_total_number_of_health_deficiencies_sum INT
    , cycle_1_total_number_of_health_deficiencies_min INT
    , cycle_1_total_number_of_health_deficiencies_max INT
    , cycle_1_total_number_of_health_deficiencies_rank REAL

    , cycle_1_number_of_standard_health_deficiencies_avg REAL
    , cycle_1_number_of_standard_health_deficiencies_sum INT
    , cycle_1_number_of_standard_health_deficiencies_min INT
    , cycle_1_number_of_standard_health_deficiencies_max INT
    , cycle_1_number_of_standard_health_deficiencies_rank REAL

    , cycle_1_number_of_complaint_health_deficiencies_avg REAL
    , cycle_1_number_of_complaint_health_deficiencies_sum INT
    , cycle_1_number_of_complaint_health_deficiencies_min INT
    , cycle_1_number_of_complaint_health_deficiencies_max INT
    , cycle_1_number_of_complaint_health_deficiencies_rank REAL

    , cycle_1_health_deficiency_score_avg REAL
    , cycle_1_health_deficiency_score_sum INT
    , cycle_1_health_deficiency_score_min INT
    , cycle_1_health_deficiency_score_max INT
    , cycle_1_health_deficiency_score_rank REAL

    , cycle_1_number_of_health_revisits_avg REAL
    , cycle_1_number_of_health_revisits_sum INT
    , cycle_1_number_of_health_revisits_min INT
    , cycle_1_number_of_health_revisits_max INT
    , cycle_1_number_of_health_revisits_rank REAL

    , cycle_1_health_revisit_score_avg REAL
    , cycle_1_health_revisit_score_sum INT
    , cycle_1_health_revisit_score_min INT
    , cycle_1_health_revisit_score_max INT
    , cycle_1_health_revisit_score_rank REAL

    , cycle_1_total_health_score_avg REAL
    , cycle_1_total_health_score_sum INT
    , cycle_1_total_health_score_min INT
    , cycle_1_total_health_score_max INT
    , cycle_1_total_health_score_rank REAL


    , cycle_2_total_number_of_health_deficiencies_avg REAL
    , cycle_2_total_number_of_health_deficiencies_sum INT
    , cycle_2_total_number_of_health_deficiencies_min INT
    , cycle_2_total_number_of_health_deficiencies_max INT
    , cycle_2_total_number_of_health_deficiencies_rank REAL

    , cycle_2_number_of_standard_health_deficiencies_avg REAL
    , cycle_2_number_of_standard_health_deficiencies_sum INT
    , cycle_2_number_of_standard_health_deficiencies_min INT
    , cycle_2_number_of_standard_health_deficiencies_max INT
    , cycle_2_number_of_standard_health_deficiencies_rank REAL

    , cycle_2_number_of_complaint_health_deficiencies_avg REAL
    , cycle_2_number_of_complaint_health_deficiencies_sum INT
    , cycle_2_number_of_complaint_health_deficiencies_min INT
    , cycle_2_number_of_complaint_health_deficiencies_max INT
    , cycle_2_number_of_complaint_health_deficiencies_rank REAL

    , cycle_2_health_deficiency_score_avg REAL
    , cycle_2_health_deficiency_score_sum INT
    , cycle_2_health_deficiency_score_min INT
    , cycle_2_health_deficiency_score_max INT
    , cycle_2_health_deficiency_score_rank REAL

    , cycle_2_number_of_health_revisits_avg REAL
    , cycle_2_number_of_health_revisits_sum INT
    , cycle_2_number_of_health_revisits_min INT
    , cycle_2_number_of_health_revisits_max INT
    , cycle_2_number_of_health_revisits_rank REAL

    , cycle_2_health_revisit_score_avg REAL
    , cycle_2_health_revisit_score_sum INT
    , cycle_2_health_revisit_score_min INT
    , cycle_2_health_revisit_score_max INT
    , cycle_2_health_revisit_score_rank REAL

    , cycle_2_total_health_score_avg REAL
    , cycle_2_total_health_score_sum INT
    , cycle_2_total_health_score_min INT
    , cycle_2_total_health_score_max INT
    , cycle_2_total_health_score_rank REAL


    , cycle_3_total_number_of_health_deficiencies_avg REAL
    , cycle_3_total_number_of_health_deficiencies_sum INT
    , cycle_3_total_number_of_health_deficiencies_min INT
    , cycle_3_total_number_of_health_deficiencies_max INT
    , cycle_3_total_number_of_health_deficiencies_rank REAL

    , cycle_3_number_of_standard_health_deficiencies_avg REAL
    , cycle_3_number_of_standard_health_deficiencies_sum INT
    , cycle_3_number_of_standard_health_deficiencies_min INT
    , cycle_3_number_of_standard_health_deficiencies_max INT
    , cycle_3_number_of_standard_health_deficiencies_rank REAL

    , cycle_3_number_of_complaint_health_deficiencies_avg REAL
    , cycle_3_number_of_complaint_health_deficiencies_sum INT
    , cycle_3_number_of_complaint_health_deficiencies_min INT
    , cycle_3_number_of_complaint_health_deficiencies_max INT
    , cycle_3_number_of_complaint_health_deficiencies_rank REAL

    , cycle_3_health_deficiency_score_avg REAL
    , cycle_3_health_deficiency_score_sum INT
    , cycle_3_health_deficiency_score_min INT
    , cycle_3_health_deficiency_score_max INT
    , cycle_3_health_deficiency_score_rank REAL

    , cycle_3_number_of_health_revisits_avg REAL
    , cycle_3_number_of_health_revisits_sum INT
    , cycle_3_number_of_health_revisits_min INT
    , cycle_3_number_of_health_revisits_max INT
    , cycle_3_number_of_health_revisits_rank REAL

    , cycle_3_health_revisit_score_avg REAL
    , cycle_3_health_revisit_score_sum INT
    , cycle_3_health_revisit_score_min INT
    , cycle_3_health_revisit_score_max INT
    , cycle_3_health_revisit_score_rank REAL

    , cycle_3_total_health_score_avg REAL
    , cycle_3_total_health_score_sum INT
    , cycle_3_total_health_score_min INT
    , cycle_3_total_health_score_max INT
    , cycle_3_total_health_score_rank REAL


    , CONSTRAINT pk_summary__survey_state PRIMARY KEY (state_id)
);

INSERT INTO summary.survey_state
SELECT 
    state_id
    
    , CAST(AVG(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_avg
    , CAST(SUM(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_sum
    , CAST(MIN(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_min
    , CAST(MAX(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_max
    , RANK() OVER (PARTITION BY AVG(total_weighted_health_survey_score) IS NOT NULL ORDER BY AVG(total_weighted_health_survey_score)) AS total_weighted_health_survey_score_rank

    , CAST(AVG(number_of_facility_reported_incidents) AS REAL) AS number_of_facility_reported_incidents_avg
    , CAST(SUM(number_of_facility_reported_incidents) AS INT) AS number_of_facility_reported_incidents_sum
    , CAST(MIN(number_of_facility_reported_incidents) AS INT) AS number_of_facility_reported_incidents_min
    , CAST(MAX(number_of_facility_reported_incidents) AS INT) AS number_of_facility_reported_incidents_max
    , RANK() OVER (PARTITION BY AVG(number_of_facility_reported_incidents) IS NOT NULL ORDER BY AVG(number_of_facility_reported_incidents)) AS number_of_facility_reported_incidents_rank

    , CAST(AVG(number_of_substantiated_complaints) AS REAL) AS number_of_substantiated_complaints_avg
    , CAST(SUM(number_of_substantiated_complaints) AS INT) AS number_of_substantiated_complaints_sum
    , CAST(MIN(number_of_substantiated_complaints) AS INT) AS number_of_substantiated_complaints_min
    , CAST(MAX(number_of_substantiated_complaints) AS INT) AS number_of_substantiated_complaints_max
    , RANK() OVER (PARTITION BY AVG(number_of_substantiated_complaints) IS NOT NULL ORDER BY AVG(number_of_substantiated_complaints)) AS number_of_substantiated_complaints_rank

    , CAST(AVG(number_of_fines) AS REAL) AS number_of_fines_avg
    , CAST(SUM(number_of_fines) AS INT) AS number_of_fines_sum
    , CAST(MIN(number_of_fines) AS INT) AS number_of_fines_min
    , CAST(MAX(number_of_fines) AS INT) AS number_of_fines_max
    , RANK() OVER (PARTITION BY AVG(number_of_fines) IS NOT NULL ORDER BY AVG(number_of_fines)) AS number_of_fines_rank

    , CAST(AVG(total_amount_of_fines_in_dollars) AS REAL) AS total_amount_of_fines_in_dollars_avg
    , CAST(SUM(total_amount_of_fines_in_dollars) AS INT) AS total_amount_of_fines_in_dollars_sum
    , CAST(MIN(total_amount_of_fines_in_dollars) AS INT) AS total_amount_of_fines_in_dollars_min
    , CAST(MAX(total_amount_of_fines_in_dollars) AS INT) AS total_amount_of_fines_in_dollars_max
    , RANK() OVER (PARTITION BY AVG(total_amount_of_fines_in_dollars) IS NOT NULL ORDER BY AVG(total_amount_of_fines_in_dollars)) AS total_amount_of_fines_in_dollars_rank

    , CAST(AVG(number_of_payment_denials) AS REAL) AS number_of_payment_denials_avg
    , CAST(SUM(number_of_payment_denials) AS INT) AS number_of_payment_denials_sum
    , CAST(MIN(number_of_payment_denials) AS INT) AS number_of_payment_denials_min
    , CAST(MAX(number_of_payment_denials) AS INT) AS number_of_payment_denials_max
    , RANK() OVER (PARTITION BY AVG(number_of_payment_denials) IS NOT NULL ORDER BY AVG(number_of_payment_denials)) AS number_of_payment_denials_rank

    , CAST(AVG(total_number_of_penalties) AS REAL) AS total_number_of_penalties_avg
    , CAST(SUM(total_number_of_penalties) AS INT) AS total_number_of_penalties_sum
    , CAST(MIN(total_number_of_penalties) AS INT) AS total_number_of_penalties_min
    , CAST(MAX(total_number_of_penalties) AS INT) AS total_number_of_penalties_max
    , RANK() OVER (PARTITION BY AVG(total_number_of_penalties) IS NOT NULL ORDER BY AVG(total_number_of_penalties)) AS total_number_of_penalties_rank

    , CAST(AVG(cycle_1_total_number_of_health_deficiencies) AS REAL) AS cycle_1_total_number_of_health_deficiencies_avg
    , CAST(SUM(cycle_1_total_number_of_health_deficiencies) AS INT) AS cycle_1_total_number_of_health_deficiencies_sum
    , CAST(MIN(cycle_1_total_number_of_health_deficiencies) AS INT) AS cycle_1_total_number_of_health_deficiencies_min
    , CAST(MAX(cycle_1_total_number_of_health_deficiencies) AS INT) AS cycle_1_total_number_of_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_total_number_of_health_deficiencies) IS NOT NULL ORDER BY AVG(cycle_1_total_number_of_health_deficiencies)) AS cycle_1_total_number_of_health_deficiencies_rank

    , CAST(AVG(cycle_1_number_of_standard_health_deficiencies) AS REAL) AS cycle_1_number_of_standard_health_deficiencies_avg
    , CAST(SUM(cycle_1_number_of_standard_health_deficiencies) AS INT) AS cycle_1_number_of_standard_health_deficiencies_sum
    , CAST(MIN(cycle_1_number_of_standard_health_deficiencies) AS INT) AS cycle_1_number_of_standard_health_deficiencies_min
    , CAST(MAX(cycle_1_number_of_standard_health_deficiencies) AS INT) AS cycle_1_number_of_standard_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_number_of_standard_health_deficiencies) IS NOT NULL ORDER BY AVG(cycle_1_number_of_standard_health_deficiencies)) AS cycle_1_number_of_standard_health_deficiencies_rank

    , CAST(AVG(cycle_1_number_of_complaint_health_deficiencies) AS REAL) AS cycle_1_number_of_complaint_health_deficiencies_avg
    , CAST(SUM(cycle_1_number_of_complaint_health_deficiencies) AS INT) AS cycle_1_number_of_complaint_health_deficiencies_sum
    , CAST(MIN(cycle_1_number_of_complaint_health_deficiencies) AS INT) AS cycle_1_number_of_complaint_health_deficiencies_min
    , CAST(MAX(cycle_1_number_of_complaint_health_deficiencies) AS INT) AS cycle_1_number_of_complaint_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_number_of_complaint_health_deficiencies) IS NOT NULL ORDER BY AVG(cycle_1_number_of_complaint_health_deficiencies)) AS cycle_1_number_of_complaint_health_deficiencies_rank

    , CAST(AVG(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_avg
    , CAST(SUM(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_sum
    , CAST(MIN(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_min
    , CAST(MAX(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_health_deficiency_score) IS NOT NULL ORDER BY AVG(cycle_1_health_deficiency_score)) AS cycle_1_health_deficiency_score_rank

    , CAST(AVG(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_avg
    , CAST(SUM(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_sum
    , CAST(MIN(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_min
    , CAST(MAX(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_number_of_health_revisits) IS NOT NULL ORDER BY AVG(cycle_1_number_of_health_revisits)) AS cycle_1_number_of_health_revisits_rank

    , CAST(AVG(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_avg
    , CAST(SUM(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_sum
    , CAST(MIN(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_min
    , CAST(MAX(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_health_revisit_score) IS NOT NULL ORDER BY AVG(cycle_1_health_revisit_score)) AS cycle_1_health_revisit_score_rank

    , CAST(AVG(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_avg
    , CAST(SUM(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_sum
    , CAST(MIN(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_min
    , CAST(MAX(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_total_health_score) IS NOT NULL ORDER BY AVG(cycle_1_total_health_score)) AS cycle_1_total_health_score_rank

    , CAST(AVG(cycle_2_total_number_of_health_deficiencies) AS REAL) AS cycle_2_total_number_of_health_deficiencies_avg
    , CAST(SUM(cycle_2_total_number_of_health_deficiencies) AS INT) AS cycle_2_total_number_of_health_deficiencies_sum
    , CAST(MIN(cycle_2_total_number_of_health_deficiencies) AS INT) AS cycle_2_total_number_of_health_deficiencies_min
    , CAST(MAX(cycle_2_total_number_of_health_deficiencies) AS INT) AS cycle_2_total_number_of_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_total_number_of_health_deficiencies) IS NOT NULL ORDER BY AVG(cycle_2_total_number_of_health_deficiencies)) AS cycle_2_total_number_of_health_deficiencies_rank

    , CAST(AVG(cycle_2_number_of_standard_health_deficiencies) AS REAL) AS cycle_2_number_of_standard_health_deficiencies_avg
    , CAST(SUM(cycle_2_number_of_standard_health_deficiencies) AS INT) AS cycle_2_number_of_standard_health_deficiencies_sum
    , CAST(MIN(cycle_2_number_of_standard_health_deficiencies) AS INT) AS cycle_2_number_of_standard_health_deficiencies_min
    , CAST(MAX(cycle_2_number_of_standard_health_deficiencies) AS INT) AS cycle_2_number_of_standard_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_number_of_standard_health_deficiencies) IS NOT NULL ORDER BY AVG(cycle_2_number_of_standard_health_deficiencies)) AS cycle_2_number_of_standard_health_deficiencies_rank

    , CAST(AVG(cycle_2_number_of_complaint_health_deficiencies) AS REAL) AS cycle_2_number_of_complaint_health_deficiencies_avg
    , CAST(SUM(cycle_2_number_of_complaint_health_deficiencies) AS INT) AS cycle_2_number_of_complaint_health_deficiencies_sum
    , CAST(MIN(cycle_2_number_of_complaint_health_deficiencies) AS INT) AS cycle_2_number_of_complaint_health_deficiencies_min
    , CAST(MAX(cycle_2_number_of_complaint_health_deficiencies) AS INT) AS cycle_2_number_of_complaint_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_number_of_complaint_health_deficiencies) IS NOT NULL ORDER BY AVG(cycle_2_number_of_complaint_health_deficiencies)) AS cycle_2_number_of_complaint_health_deficiencies_rank

    , CAST(AVG(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_avg
    , CAST(SUM(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_sum
    , CAST(MIN(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_min
    , CAST(MAX(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_health_deficiency_score) IS NOT NULL ORDER BY AVG(cycle_2_health_deficiency_score)) AS cycle_2_health_deficiency_score_rank

    , CAST(AVG(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_avg
    , CAST(SUM(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_sum
    , CAST(MIN(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_min
    , CAST(MAX(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_number_of_health_revisits) IS NOT NULL ORDER BY AVG(cycle_2_number_of_health_revisits)) AS cycle_2_number_of_health_revisits_rank

    , CAST(AVG(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_avg
    , CAST(SUM(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_sum
    , CAST(MIN(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_min
    , CAST(MAX(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_health_revisit_score) IS NOT NULL ORDER BY AVG(cycle_2_health_revisit_score)) AS cycle_2_health_revisit_score_rank

    , CAST(AVG(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_avg
    , CAST(SUM(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_sum
    , CAST(MIN(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_min
    , CAST(MAX(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_total_health_score) IS NOT NULL ORDER BY AVG(cycle_2_total_health_score)) AS cycle_2_total_health_score_rank

    , CAST(AVG(cycle_3_total_number_of_health_deficiencies) AS REAL) AS cycle_3_total_number_of_health_deficiencies_avg
    , CAST(SUM(cycle_3_total_number_of_health_deficiencies) AS INT) AS cycle_3_total_number_of_health_deficiencies_sum
    , CAST(MIN(cycle_3_total_number_of_health_deficiencies) AS INT) AS cycle_3_total_number_of_health_deficiencies_min
    , CAST(MAX(cycle_3_total_number_of_health_deficiencies) AS INT) AS cycle_3_total_number_of_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_total_number_of_health_deficiencies) IS NOT NULL ORDER BY AVG(cycle_3_total_number_of_health_deficiencies)) AS cycle_3_total_number_of_health_deficiencies_rank

    , CAST(AVG(cycle_3_number_of_standard_health_deficiencies) AS REAL) AS cycle_3_number_of_standard_health_deficiencies_avg
    , CAST(SUM(cycle_3_number_of_standard_health_deficiencies) AS INT) AS cycle_3_number_of_standard_health_deficiencies_sum
    , CAST(MIN(cycle_3_number_of_standard_health_deficiencies) AS INT) AS cycle_3_number_of_standard_health_deficiencies_min
    , CAST(MAX(cycle_3_number_of_standard_health_deficiencies) AS INT) AS cycle_3_number_of_standard_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_number_of_standard_health_deficiencies) IS NOT NULL ORDER BY AVG(cycle_3_number_of_standard_health_deficiencies)) AS cycle_3_number_of_standard_health_deficiencies_rank

    , CAST(AVG(cycle_3_number_of_complaint_health_deficiencies) AS REAL) AS cycle_3_number_of_complaint_health_deficiencies_avg
    , CAST(SUM(cycle_3_number_of_complaint_health_deficiencies) AS INT) AS cycle_3_number_of_complaint_health_deficiencies_sum
    , CAST(MIN(cycle_3_number_of_complaint_health_deficiencies) AS INT) AS cycle_3_number_of_complaint_health_deficiencies_min
    , CAST(MAX(cycle_3_number_of_complaint_health_deficiencies) AS INT) AS cycle_3_number_of_complaint_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_number_of_complaint_health_deficiencies) IS NOT NULL ORDER BY AVG(cycle_3_number_of_complaint_health_deficiencies)) AS cycle_3_number_of_complaint_health_deficiencies_rank

    , CAST(AVG(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_avg
    , CAST(SUM(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_sum
    , CAST(MIN(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_min
    , CAST(MAX(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_health_deficiency_score) IS NOT NULL ORDER BY AVG(cycle_3_health_deficiency_score)) AS cycle_3_health_deficiency_score_rank

    , CAST(AVG(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_avg
    , CAST(SUM(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_sum
    , CAST(MIN(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_min
    , CAST(MAX(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_number_of_health_revisits) IS NOT NULL ORDER BY AVG(cycle_3_number_of_health_revisits)) AS cycle_3_number_of_health_revisits_rank

    , CAST(AVG(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_avg
    , CAST(SUM(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_sum
    , CAST(MIN(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_min
    , CAST(MAX(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_health_revisit_score) IS NOT NULL ORDER BY AVG(cycle_3_health_revisit_score)) AS cycle_3_health_revisit_score_rank

    , CAST(AVG(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_avg
    , CAST(SUM(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_sum
    , CAST(MIN(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_min
    , CAST(MAX(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_total_health_score) IS NOT NULL ORDER BY AVG(cycle_3_total_health_score)) AS cycle_3_total_health_score_rank

FROM PUBLIC.survey s
INNER JOIN PUBLIC.providers p
    ON p.provnum = s.provnum
GROUP BY state_id
ORDER BY state_id;


-- SELECT * FROM summary.survey_state





-- summary.survey_county

DROP TABLE IF EXISTS summary.survey_county;

CREATE TABLE summary.survey_county (
    state_id INT
    , county_id INT

    , total_weighted_health_survey_score_avg REAL
    , total_weighted_health_survey_score_sum REAL
    , total_weighted_health_survey_score_min REAL
    , total_weighted_health_survey_score_max REAL
    , total_weighted_health_survey_score_rank REAL

    , number_of_facility_reported_incidents_avg REAL
    , number_of_facility_reported_incidents_sum REAL
    , number_of_facility_reported_incidents_min INT
    , number_of_facility_reported_incidents_max INT
    , number_of_facility_reported_incidents_rank REAL

    , number_of_substantiated_complaints_avg REAL
    , number_of_substantiated_complaints_sum INT
    , number_of_substantiated_complaints_min INT
    , number_of_substantiated_complaints_max INT
    , number_of_substantiated_complaints_rank REAL

    , number_of_fines_avg REAL
    , number_of_fines_sum INT
    , number_of_fines_min INT
    , number_of_fines_max INT
    , number_of_fines_rank REAL

    , total_amount_of_fines_in_dollars_avg REAL
    , total_amount_of_fines_in_dollars_sum INT
    , total_amount_of_fines_in_dollars_min INT
    , total_amount_of_fines_in_dollars_max INT
    , total_amount_of_fines_in_dollars_rank REAL

    , number_of_payment_denials_avg REAL
    , number_of_payment_denials_sum INT
    , number_of_payment_denials_min INT
    , number_of_payment_denials_max INT
    , number_of_payment_denials_rank REAL

    , total_number_of_penalties_avg REAL
    , total_number_of_penalties_sum INT
    , total_number_of_penalties_min INT
    , total_number_of_penalties_max INT
    , total_number_of_penalties_rank REAL


    , cycle_1_total_number_of_health_deficiencies_avg REAL
    , cycle_1_total_number_of_health_deficiencies_sum INT
    , cycle_1_total_number_of_health_deficiencies_min INT
    , cycle_1_total_number_of_health_deficiencies_max INT
    , cycle_1_total_number_of_health_deficiencies_rank REAL

    , cycle_1_number_of_standard_health_deficiencies_avg REAL
    , cycle_1_number_of_standard_health_deficiencies_sum INT
    , cycle_1_number_of_standard_health_deficiencies_min INT
    , cycle_1_number_of_standard_health_deficiencies_max INT
    , cycle_1_number_of_standard_health_deficiencies_rank REAL

    , cycle_1_number_of_complaint_health_deficiencies_avg REAL
    , cycle_1_number_of_complaint_health_deficiencies_sum INT
    , cycle_1_number_of_complaint_health_deficiencies_min INT
    , cycle_1_number_of_complaint_health_deficiencies_max INT
    , cycle_1_number_of_complaint_health_deficiencies_rank REAL

    , cycle_1_health_deficiency_score_avg REAL
    , cycle_1_health_deficiency_score_sum INT
    , cycle_1_health_deficiency_score_min INT
    , cycle_1_health_deficiency_score_max INT
    , cycle_1_health_deficiency_score_rank REAL

    , cycle_1_number_of_health_revisits_avg REAL
    , cycle_1_number_of_health_revisits_sum INT
    , cycle_1_number_of_health_revisits_min INT
    , cycle_1_number_of_health_revisits_max INT
    , cycle_1_number_of_health_revisits_rank REAL

    , cycle_1_health_revisit_score_avg REAL
    , cycle_1_health_revisit_score_sum INT
    , cycle_1_health_revisit_score_min INT
    , cycle_1_health_revisit_score_max INT
    , cycle_1_health_revisit_score_rank REAL

    , cycle_1_total_health_score_avg REAL
    , cycle_1_total_health_score_sum INT
    , cycle_1_total_health_score_min INT
    , cycle_1_total_health_score_max INT
    , cycle_1_total_health_score_rank REAL


    , cycle_2_total_number_of_health_deficiencies_avg REAL
    , cycle_2_total_number_of_health_deficiencies_sum INT
    , cycle_2_total_number_of_health_deficiencies_min INT
    , cycle_2_total_number_of_health_deficiencies_max INT
    , cycle_2_total_number_of_health_deficiencies_rank REAL

    , cycle_2_number_of_standard_health_deficiencies_avg REAL
    , cycle_2_number_of_standard_health_deficiencies_sum INT
    , cycle_2_number_of_standard_health_deficiencies_min INT
    , cycle_2_number_of_standard_health_deficiencies_max INT
    , cycle_2_number_of_standard_health_deficiencies_rank REAL

    , cycle_2_number_of_complaint_health_deficiencies_avg REAL
    , cycle_2_number_of_complaint_health_deficiencies_sum INT
    , cycle_2_number_of_complaint_health_deficiencies_min INT
    , cycle_2_number_of_complaint_health_deficiencies_max INT
    , cycle_2_number_of_complaint_health_deficiencies_rank REAL

    , cycle_2_health_deficiency_score_avg REAL
    , cycle_2_health_deficiency_score_sum INT
    , cycle_2_health_deficiency_score_min INT
    , cycle_2_health_deficiency_score_max INT
    , cycle_2_health_deficiency_score_rank REAL

    , cycle_2_number_of_health_revisits_avg REAL
    , cycle_2_number_of_health_revisits_sum INT
    , cycle_2_number_of_health_revisits_min INT
    , cycle_2_number_of_health_revisits_max INT
    , cycle_2_number_of_health_revisits_rank REAL

    , cycle_2_health_revisit_score_avg REAL
    , cycle_2_health_revisit_score_sum INT
    , cycle_2_health_revisit_score_min INT
    , cycle_2_health_revisit_score_max INT
    , cycle_2_health_revisit_score_rank REAL

    , cycle_2_total_health_score_avg REAL
    , cycle_2_total_health_score_sum INT
    , cycle_2_total_health_score_min INT
    , cycle_2_total_health_score_max INT
    , cycle_2_total_health_score_rank REAL


    , cycle_3_total_number_of_health_deficiencies_avg REAL
    , cycle_3_total_number_of_health_deficiencies_sum INT
    , cycle_3_total_number_of_health_deficiencies_min INT
    , cycle_3_total_number_of_health_deficiencies_max INT
    , cycle_3_total_number_of_health_deficiencies_rank REAL

    , cycle_3_number_of_standard_health_deficiencies_avg REAL
    , cycle_3_number_of_standard_health_deficiencies_sum INT
    , cycle_3_number_of_standard_health_deficiencies_min INT
    , cycle_3_number_of_standard_health_deficiencies_max INT
    , cycle_3_number_of_standard_health_deficiencies_rank REAL

    , cycle_3_number_of_complaint_health_deficiencies_avg REAL
    , cycle_3_number_of_complaint_health_deficiencies_sum INT
    , cycle_3_number_of_complaint_health_deficiencies_min INT
    , cycle_3_number_of_complaint_health_deficiencies_max INT
    , cycle_3_number_of_complaint_health_deficiencies_rank REAL

    , cycle_3_health_deficiency_score_avg REAL
    , cycle_3_health_deficiency_score_sum INT
    , cycle_3_health_deficiency_score_min INT
    , cycle_3_health_deficiency_score_max INT
    , cycle_3_health_deficiency_score_rank REAL

    , cycle_3_number_of_health_revisits_avg REAL
    , cycle_3_number_of_health_revisits_sum INT
    , cycle_3_number_of_health_revisits_min INT
    , cycle_3_number_of_health_revisits_max INT
    , cycle_3_number_of_health_revisits_rank REAL

    , cycle_3_health_revisit_score_avg REAL
    , cycle_3_health_revisit_score_sum INT
    , cycle_3_health_revisit_score_min INT
    , cycle_3_health_revisit_score_max INT
    , cycle_3_health_revisit_score_rank REAL

    , cycle_3_total_health_score_avg REAL
    , cycle_3_total_health_score_sum INT
    , cycle_3_total_health_score_min INT
    , cycle_3_total_health_score_max INT
    , cycle_3_total_health_score_rank REAL
    
    
    , CONSTRAINT pk_summary__survey_county PRIMARY KEY (state_id, county_id)
);

INSERT INTO summary.survey_county
SELECT 
    state_id
    , county_id

    , CAST(AVG(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_avg
    , CAST(SUM(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_sum
    , CAST(MIN(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_min
    , CAST(MAX(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_max
    , RANK() OVER (PARTITION BY AVG(total_weighted_health_survey_score) IS NOT NULL, state_id ORDER BY AVG(total_weighted_health_survey_score)) AS total_weighted_health_survey_score_rank

    , CAST(AVG(number_of_facility_reported_incidents) AS REAL) AS number_of_facility_reported_incidents_avg
    , CAST(SUM(number_of_facility_reported_incidents) AS INT) AS number_of_facility_reported_incidents_sum
    , CAST(MIN(number_of_facility_reported_incidents) AS INT) AS number_of_facility_reported_incidents_min
    , CAST(MAX(number_of_facility_reported_incidents) AS INT) AS number_of_facility_reported_incidents_max
    , RANK() OVER (PARTITION BY AVG(number_of_facility_reported_incidents) IS NOT NULL, state_id ORDER BY AVG(number_of_facility_reported_incidents)) AS number_of_facility_reported_incidents_rank

    , CAST(AVG(number_of_substantiated_complaints) AS REAL) AS number_of_substantiated_complaints_avg
    , CAST(SUM(number_of_substantiated_complaints) AS INT) AS number_of_substantiated_complaints_sum
    , CAST(MIN(number_of_substantiated_complaints) AS INT) AS number_of_substantiated_complaints_min
    , CAST(MAX(number_of_substantiated_complaints) AS INT) AS number_of_substantiated_complaints_max
    , RANK() OVER (PARTITION BY AVG(number_of_substantiated_complaints) IS NOT NULL, state_id ORDER BY AVG(number_of_substantiated_complaints)) AS number_of_substantiated_complaints_rank

    , CAST(AVG(number_of_fines) AS REAL) AS number_of_fines_avg
    , CAST(SUM(number_of_fines) AS INT) AS number_of_fines_sum
    , CAST(MIN(number_of_fines) AS INT) AS number_of_fines_min
    , CAST(MAX(number_of_fines) AS INT) AS number_of_fines_max
    , RANK() OVER (PARTITION BY AVG(number_of_fines) IS NOT NULL, state_id ORDER BY AVG(number_of_fines)) AS number_of_fines_rank

    , CAST(AVG(total_amount_of_fines_in_dollars) AS REAL) AS total_amount_of_fines_in_dollars_avg
    , CAST(SUM(total_amount_of_fines_in_dollars) AS INT) AS total_amount_of_fines_in_dollars_sum
    , CAST(MIN(total_amount_of_fines_in_dollars) AS INT) AS total_amount_of_fines_in_dollars_min
    , CAST(MAX(total_amount_of_fines_in_dollars) AS INT) AS total_amount_of_fines_in_dollars_max
    , RANK() OVER (PARTITION BY AVG(total_amount_of_fines_in_dollars) IS NOT NULL, state_id ORDER BY AVG(total_amount_of_fines_in_dollars)) AS total_amount_of_fines_in_dollars_rank

    , CAST(AVG(number_of_payment_denials) AS REAL) AS number_of_payment_denials_avg
    , CAST(SUM(number_of_payment_denials) AS INT) AS number_of_payment_denials_sum
    , CAST(MIN(number_of_payment_denials) AS INT) AS number_of_payment_denials_min
    , CAST(MAX(number_of_payment_denials) AS INT) AS number_of_payment_denials_max
    , RANK() OVER (PARTITION BY AVG(number_of_payment_denials) IS NOT NULL, state_id ORDER BY AVG(number_of_payment_denials)) AS number_of_payment_denials_rank

    , CAST(AVG(total_number_of_penalties) AS REAL) AS total_number_of_penalties_avg
    , CAST(SUM(total_number_of_penalties) AS INT) AS total_number_of_penalties_sum
    , CAST(MIN(total_number_of_penalties) AS INT) AS total_number_of_penalties_min
    , CAST(MAX(total_number_of_penalties) AS INT) AS total_number_of_penalties_max
    , RANK() OVER (PARTITION BY AVG(total_number_of_penalties) IS NOT NULL, state_id ORDER BY AVG(total_number_of_penalties)) AS total_number_of_penalties_rank

    , CAST(AVG(cycle_1_total_number_of_health_deficiencies) AS REAL) AS cycle_1_total_number_of_health_deficiencies_avg
    , CAST(SUM(cycle_1_total_number_of_health_deficiencies) AS INT) AS cycle_1_total_number_of_health_deficiencies_sum
    , CAST(MIN(cycle_1_total_number_of_health_deficiencies) AS INT) AS cycle_1_total_number_of_health_deficiencies_min
    , CAST(MAX(cycle_1_total_number_of_health_deficiencies) AS INT) AS cycle_1_total_number_of_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_total_number_of_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_1_total_number_of_health_deficiencies)) AS cycle_1_total_number_of_health_deficiencies_rank

    , CAST(AVG(cycle_1_number_of_standard_health_deficiencies) AS REAL) AS cycle_1_number_of_standard_health_deficiencies_avg
    , CAST(SUM(cycle_1_number_of_standard_health_deficiencies) AS INT) AS cycle_1_number_of_standard_health_deficiencies_sum
    , CAST(MIN(cycle_1_number_of_standard_health_deficiencies) AS INT) AS cycle_1_number_of_standard_health_deficiencies_min
    , CAST(MAX(cycle_1_number_of_standard_health_deficiencies) AS INT) AS cycle_1_number_of_standard_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_number_of_standard_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_1_number_of_standard_health_deficiencies)) AS cycle_1_number_of_standard_health_deficiencies_rank

    , CAST(AVG(cycle_1_number_of_complaint_health_deficiencies) AS REAL) AS cycle_1_number_of_complaint_health_deficiencies_avg
    , CAST(SUM(cycle_1_number_of_complaint_health_deficiencies) AS INT) AS cycle_1_number_of_complaint_health_deficiencies_sum
    , CAST(MIN(cycle_1_number_of_complaint_health_deficiencies) AS INT) AS cycle_1_number_of_complaint_health_deficiencies_min
    , CAST(MAX(cycle_1_number_of_complaint_health_deficiencies) AS INT) AS cycle_1_number_of_complaint_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_number_of_complaint_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_1_number_of_complaint_health_deficiencies)) AS cycle_1_number_of_complaint_health_deficiencies_rank

    , CAST(AVG(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_avg
    , CAST(SUM(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_sum
    , CAST(MIN(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_min
    , CAST(MAX(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_health_deficiency_score) IS NOT NULL, state_id ORDER BY AVG(cycle_1_health_deficiency_score)) AS cycle_1_health_deficiency_score_rank

    , CAST(AVG(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_avg
    , CAST(SUM(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_sum
    , CAST(MIN(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_min
    , CAST(MAX(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_number_of_health_revisits) IS NOT NULL, state_id ORDER BY AVG(cycle_1_number_of_health_revisits)) AS cycle_1_number_of_health_revisits_rank

    , CAST(AVG(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_avg
    , CAST(SUM(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_sum
    , CAST(MIN(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_min
    , CAST(MAX(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_health_revisit_score) IS NOT NULL, state_id ORDER BY AVG(cycle_1_health_revisit_score)) AS cycle_1_health_revisit_score_rank

    , CAST(AVG(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_avg
    , CAST(SUM(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_sum
    , CAST(MIN(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_min
    , CAST(MAX(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_total_health_score) IS NOT NULL, state_id ORDER BY AVG(cycle_1_total_health_score)) AS cycle_1_total_health_score_rank

    , CAST(AVG(cycle_2_total_number_of_health_deficiencies) AS REAL) AS cycle_2_total_number_of_health_deficiencies_avg
    , CAST(SUM(cycle_2_total_number_of_health_deficiencies) AS INT) AS cycle_2_total_number_of_health_deficiencies_sum
    , CAST(MIN(cycle_2_total_number_of_health_deficiencies) AS INT) AS cycle_2_total_number_of_health_deficiencies_min
    , CAST(MAX(cycle_2_total_number_of_health_deficiencies) AS INT) AS cycle_2_total_number_of_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_total_number_of_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_2_total_number_of_health_deficiencies)) AS cycle_2_total_number_of_health_deficiencies_rank

    , CAST(AVG(cycle_2_number_of_standard_health_deficiencies) AS REAL) AS cycle_2_number_of_standard_health_deficiencies_avg
    , CAST(SUM(cycle_2_number_of_standard_health_deficiencies) AS INT) AS cycle_2_number_of_standard_health_deficiencies_sum
    , CAST(MIN(cycle_2_number_of_standard_health_deficiencies) AS INT) AS cycle_2_number_of_standard_health_deficiencies_min
    , CAST(MAX(cycle_2_number_of_standard_health_deficiencies) AS INT) AS cycle_2_number_of_standard_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_number_of_standard_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_2_number_of_standard_health_deficiencies)) AS cycle_2_number_of_standard_health_deficiencies_rank

    , CAST(AVG(cycle_2_number_of_complaint_health_deficiencies) AS REAL) AS cycle_2_number_of_complaint_health_deficiencies_avg
    , CAST(SUM(cycle_2_number_of_complaint_health_deficiencies) AS INT) AS cycle_2_number_of_complaint_health_deficiencies_sum
    , CAST(MIN(cycle_2_number_of_complaint_health_deficiencies) AS INT) AS cycle_2_number_of_complaint_health_deficiencies_min
    , CAST(MAX(cycle_2_number_of_complaint_health_deficiencies) AS INT) AS cycle_2_number_of_complaint_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_number_of_complaint_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_2_number_of_complaint_health_deficiencies)) AS cycle_2_number_of_complaint_health_deficiencies_rank

    , CAST(AVG(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_avg
    , CAST(SUM(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_sum
    , CAST(MIN(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_min
    , CAST(MAX(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_health_deficiency_score) IS NOT NULL, state_id ORDER BY AVG(cycle_2_health_deficiency_score)) AS cycle_2_health_deficiency_score_rank

    , CAST(AVG(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_avg
    , CAST(SUM(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_sum
    , CAST(MIN(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_min
    , CAST(MAX(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_number_of_health_revisits) IS NOT NULL, state_id ORDER BY AVG(cycle_2_number_of_health_revisits)) AS cycle_2_number_of_health_revisits_rank

    , CAST(AVG(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_avg
    , CAST(SUM(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_sum
    , CAST(MIN(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_min
    , CAST(MAX(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_health_revisit_score) IS NOT NULL, state_id ORDER BY AVG(cycle_2_health_revisit_score)) AS cycle_2_health_revisit_score_rank

    , CAST(AVG(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_avg
    , CAST(SUM(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_sum
    , CAST(MIN(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_min
    , CAST(MAX(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_total_health_score) IS NOT NULL, state_id ORDER BY AVG(cycle_2_total_health_score)) AS cycle_2_total_health_score_rank

    , CAST(AVG(cycle_3_total_number_of_health_deficiencies) AS REAL) AS cycle_3_total_number_of_health_deficiencies_avg
    , CAST(SUM(cycle_3_total_number_of_health_deficiencies) AS INT) AS cycle_3_total_number_of_health_deficiencies_sum
    , CAST(MIN(cycle_3_total_number_of_health_deficiencies) AS INT) AS cycle_3_total_number_of_health_deficiencies_min
    , CAST(MAX(cycle_3_total_number_of_health_deficiencies) AS INT) AS cycle_3_total_number_of_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_total_number_of_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_3_total_number_of_health_deficiencies)) AS cycle_3_total_number_of_health_deficiencies_rank

    , CAST(AVG(cycle_3_number_of_standard_health_deficiencies) AS REAL) AS cycle_3_number_of_standard_health_deficiencies_avg
    , CAST(SUM(cycle_3_number_of_standard_health_deficiencies) AS INT) AS cycle_3_number_of_standard_health_deficiencies_sum
    , CAST(MIN(cycle_3_number_of_standard_health_deficiencies) AS INT) AS cycle_3_number_of_standard_health_deficiencies_min
    , CAST(MAX(cycle_3_number_of_standard_health_deficiencies) AS INT) AS cycle_3_number_of_standard_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_number_of_standard_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_3_number_of_standard_health_deficiencies)) AS cycle_3_number_of_standard_health_deficiencies_rank

    , CAST(AVG(cycle_3_number_of_complaint_health_deficiencies) AS REAL) AS cycle_3_number_of_complaint_health_deficiencies_avg
    , CAST(SUM(cycle_3_number_of_complaint_health_deficiencies) AS INT) AS cycle_3_number_of_complaint_health_deficiencies_sum
    , CAST(MIN(cycle_3_number_of_complaint_health_deficiencies) AS INT) AS cycle_3_number_of_complaint_health_deficiencies_min
    , CAST(MAX(cycle_3_number_of_complaint_health_deficiencies) AS INT) AS cycle_3_number_of_complaint_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_number_of_complaint_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_3_number_of_complaint_health_deficiencies)) AS cycle_3_number_of_complaint_health_deficiencies_rank

    , CAST(AVG(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_avg
    , CAST(SUM(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_sum
    , CAST(MIN(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_min
    , CAST(MAX(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_health_deficiency_score) IS NOT NULL, state_id ORDER BY AVG(cycle_3_health_deficiency_score)) AS cycle_3_health_deficiency_score_rank

    , CAST(AVG(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_avg
    , CAST(SUM(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_sum
    , CAST(MIN(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_min
    , CAST(MAX(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_number_of_health_revisits) IS NOT NULL, state_id ORDER BY AVG(cycle_3_number_of_health_revisits)) AS cycle_3_number_of_health_revisits_rank

    , CAST(AVG(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_avg
    , CAST(SUM(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_sum
    , CAST(MIN(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_min
    , CAST(MAX(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_health_revisit_score) IS NOT NULL, state_id ORDER BY AVG(cycle_3_health_revisit_score)) AS cycle_3_health_revisit_score_rank

    , CAST(AVG(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_avg
    , CAST(SUM(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_sum
    , CAST(MIN(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_min
    , CAST(MAX(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_total_health_score) IS NOT NULL, state_id ORDER BY AVG(cycle_3_total_health_score)) AS cycle_3_total_health_score_rank

FROM public.survey s
    INNER JOIN public.providers p ON p.provnum = s.provnum
GROUP BY state_id, county_id
ORDER BY state_id, county_id;






-- summary.survey_city

DROP TABLE IF EXISTS summary.survey_city;

CREATE TABLE summary.survey_city (
    state_id INT
    , city_id INT

    , total_weighted_health_survey_score_avg REAL
    , total_weighted_health_survey_score_sum REAL
    , total_weighted_health_survey_score_min REAL
    , total_weighted_health_survey_score_max REAL
    , total_weighted_health_survey_score_rank REAL

    , number_of_facility_reported_incidents_avg REAL
    , number_of_facility_reported_incidents_sum REAL
    , number_of_facility_reported_incidents_min INT
    , number_of_facility_reported_incidents_max INT
    , number_of_facility_reported_incidents_rank REAL

    , number_of_substantiated_complaints_avg REAL
    , number_of_substantiated_complaints_sum INT
    , number_of_substantiated_complaints_min INT
    , number_of_substantiated_complaints_max INT
    , number_of_substantiated_complaints_rank REAL

    , number_of_fines_avg REAL
    , number_of_fines_sum INT
    , number_of_fines_min INT
    , number_of_fines_max INT
    , number_of_fines_rank REAL

    , total_amount_of_fines_in_dollars_avg REAL
    , total_amount_of_fines_in_dollars_sum INT
    , total_amount_of_fines_in_dollars_min INT
    , total_amount_of_fines_in_dollars_max INT
    , total_amount_of_fines_in_dollars_rank REAL

    , number_of_payment_denials_avg REAL
    , number_of_payment_denials_sum INT
    , number_of_payment_denials_min INT
    , number_of_payment_denials_max INT
    , number_of_payment_denials_rank REAL

    , total_number_of_penalties_avg REAL
    , total_number_of_penalties_sum INT
    , total_number_of_penalties_min INT
    , total_number_of_penalties_max INT
    , total_number_of_penalties_rank REAL


    , cycle_1_total_number_of_health_deficiencies_avg REAL
    , cycle_1_total_number_of_health_deficiencies_sum INT
    , cycle_1_total_number_of_health_deficiencies_min INT
    , cycle_1_total_number_of_health_deficiencies_max INT
    , cycle_1_total_number_of_health_deficiencies_rank REAL

    , cycle_1_number_of_standard_health_deficiencies_avg REAL
    , cycle_1_number_of_standard_health_deficiencies_sum INT
    , cycle_1_number_of_standard_health_deficiencies_min INT
    , cycle_1_number_of_standard_health_deficiencies_max INT
    , cycle_1_number_of_standard_health_deficiencies_rank REAL

    , cycle_1_number_of_complaint_health_deficiencies_avg REAL
    , cycle_1_number_of_complaint_health_deficiencies_sum INT
    , cycle_1_number_of_complaint_health_deficiencies_min INT
    , cycle_1_number_of_complaint_health_deficiencies_max INT
    , cycle_1_number_of_complaint_health_deficiencies_rank REAL

    , cycle_1_health_deficiency_score_avg REAL
    , cycle_1_health_deficiency_score_sum INT
    , cycle_1_health_deficiency_score_min INT
    , cycle_1_health_deficiency_score_max INT
    , cycle_1_health_deficiency_score_rank REAL

    , cycle_1_number_of_health_revisits_avg REAL
    , cycle_1_number_of_health_revisits_sum INT
    , cycle_1_number_of_health_revisits_min INT
    , cycle_1_number_of_health_revisits_max INT
    , cycle_1_number_of_health_revisits_rank REAL

    , cycle_1_health_revisit_score_avg REAL
    , cycle_1_health_revisit_score_sum INT
    , cycle_1_health_revisit_score_min INT
    , cycle_1_health_revisit_score_max INT
    , cycle_1_health_revisit_score_rank REAL

    , cycle_1_total_health_score_avg REAL
    , cycle_1_total_health_score_sum INT
    , cycle_1_total_health_score_min INT
    , cycle_1_total_health_score_max INT
    , cycle_1_total_health_score_rank REAL


    , cycle_2_total_number_of_health_deficiencies_avg REAL
    , cycle_2_total_number_of_health_deficiencies_sum INT
    , cycle_2_total_number_of_health_deficiencies_min INT
    , cycle_2_total_number_of_health_deficiencies_max INT
    , cycle_2_total_number_of_health_deficiencies_rank REAL

    , cycle_2_number_of_standard_health_deficiencies_avg REAL
    , cycle_2_number_of_standard_health_deficiencies_sum INT
    , cycle_2_number_of_standard_health_deficiencies_min INT
    , cycle_2_number_of_standard_health_deficiencies_max INT
    , cycle_2_number_of_standard_health_deficiencies_rank REAL

    , cycle_2_number_of_complaint_health_deficiencies_avg REAL
    , cycle_2_number_of_complaint_health_deficiencies_sum INT
    , cycle_2_number_of_complaint_health_deficiencies_min INT
    , cycle_2_number_of_complaint_health_deficiencies_max INT
    , cycle_2_number_of_complaint_health_deficiencies_rank REAL

    , cycle_2_health_deficiency_score_avg REAL
    , cycle_2_health_deficiency_score_sum INT
    , cycle_2_health_deficiency_score_min INT
    , cycle_2_health_deficiency_score_max INT
    , cycle_2_health_deficiency_score_rank REAL

    , cycle_2_number_of_health_revisits_avg REAL
    , cycle_2_number_of_health_revisits_sum INT
    , cycle_2_number_of_health_revisits_min INT
    , cycle_2_number_of_health_revisits_max INT
    , cycle_2_number_of_health_revisits_rank REAL

    , cycle_2_health_revisit_score_avg REAL
    , cycle_2_health_revisit_score_sum INT
    , cycle_2_health_revisit_score_min INT
    , cycle_2_health_revisit_score_max INT
    , cycle_2_health_revisit_score_rank REAL

    , cycle_2_total_health_score_avg REAL
    , cycle_2_total_health_score_sum INT
    , cycle_2_total_health_score_min INT
    , cycle_2_total_health_score_max INT
    , cycle_2_total_health_score_rank REAL


    , cycle_3_total_number_of_health_deficiencies_avg REAL
    , cycle_3_total_number_of_health_deficiencies_sum INT
    , cycle_3_total_number_of_health_deficiencies_min INT
    , cycle_3_total_number_of_health_deficiencies_max INT
    , cycle_3_total_number_of_health_deficiencies_rank REAL

    , cycle_3_number_of_standard_health_deficiencies_avg REAL
    , cycle_3_number_of_standard_health_deficiencies_sum INT
    , cycle_3_number_of_standard_health_deficiencies_min INT
    , cycle_3_number_of_standard_health_deficiencies_max INT
    , cycle_3_number_of_standard_health_deficiencies_rank REAL

    , cycle_3_number_of_complaint_health_deficiencies_avg REAL
    , cycle_3_number_of_complaint_health_deficiencies_sum INT
    , cycle_3_number_of_complaint_health_deficiencies_min INT
    , cycle_3_number_of_complaint_health_deficiencies_max INT
    , cycle_3_number_of_complaint_health_deficiencies_rank REAL

    , cycle_3_health_deficiency_score_avg REAL
    , cycle_3_health_deficiency_score_sum INT
    , cycle_3_health_deficiency_score_min INT
    , cycle_3_health_deficiency_score_max INT
    , cycle_3_health_deficiency_score_rank REAL

    , cycle_3_number_of_health_revisits_avg REAL
    , cycle_3_number_of_health_revisits_sum INT
    , cycle_3_number_of_health_revisits_min INT
    , cycle_3_number_of_health_revisits_max INT
    , cycle_3_number_of_health_revisits_rank REAL

    , cycle_3_health_revisit_score_avg REAL
    , cycle_3_health_revisit_score_sum INT
    , cycle_3_health_revisit_score_min INT
    , cycle_3_health_revisit_score_max INT
    , cycle_3_health_revisit_score_rank REAL

    , cycle_3_total_health_score_avg REAL
    , cycle_3_total_health_score_sum INT
    , cycle_3_total_health_score_min INT
    , cycle_3_total_health_score_max INT
    , cycle_3_total_health_score_rank REAL
    
    
    , CONSTRAINT pk_summary__survey_city PRIMARY KEY (state_id, city_id)
);

INSERT INTO summary.survey_city
SELECT 
    state_id
    , city_id

    , CAST(AVG(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_avg
    , CAST(SUM(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_sum
    , CAST(MIN(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_min
    , CAST(MAX(total_weighted_health_survey_score) AS REAL) AS total_weighted_health_survey_score_max
    , RANK() OVER (PARTITION BY AVG(total_weighted_health_survey_score) IS NOT NULL, state_id ORDER BY AVG(total_weighted_health_survey_score)) AS total_weighted_health_survey_score_rank

    , CAST(AVG(number_of_facility_reported_incidents) AS REAL) AS number_of_facility_reported_incidents_avg
    , CAST(SUM(number_of_facility_reported_incidents) AS INT) AS number_of_facility_reported_incidents_sum
    , CAST(MIN(number_of_facility_reported_incidents) AS INT) AS number_of_facility_reported_incidents_min
    , CAST(MAX(number_of_facility_reported_incidents) AS INT) AS number_of_facility_reported_incidents_max
    , RANK() OVER (PARTITION BY AVG(number_of_facility_reported_incidents) IS NOT NULL, state_id ORDER BY AVG(number_of_facility_reported_incidents)) AS number_of_facility_reported_incidents_rank

    , CAST(AVG(number_of_substantiated_complaints) AS REAL) AS number_of_substantiated_complaints_avg
    , CAST(SUM(number_of_substantiated_complaints) AS INT) AS number_of_substantiated_complaints_sum
    , CAST(MIN(number_of_substantiated_complaints) AS INT) AS number_of_substantiated_complaints_min
    , CAST(MAX(number_of_substantiated_complaints) AS INT) AS number_of_substantiated_complaints_max
    , RANK() OVER (PARTITION BY AVG(number_of_substantiated_complaints) IS NOT NULL, state_id ORDER BY AVG(number_of_substantiated_complaints)) AS number_of_substantiated_complaints_rank

    , CAST(AVG(number_of_fines) AS REAL) AS number_of_fines_avg
    , CAST(SUM(number_of_fines) AS INT) AS number_of_fines_sum
    , CAST(MIN(number_of_fines) AS INT) AS number_of_fines_min
    , CAST(MAX(number_of_fines) AS INT) AS number_of_fines_max
    , RANK() OVER (PARTITION BY AVG(number_of_fines) IS NOT NULL, state_id ORDER BY AVG(number_of_fines)) AS number_of_fines_rank

    , CAST(AVG(total_amount_of_fines_in_dollars) AS REAL) AS total_amount_of_fines_in_dollars_avg
    , CAST(SUM(total_amount_of_fines_in_dollars) AS INT) AS total_amount_of_fines_in_dollars_sum
    , CAST(MIN(total_amount_of_fines_in_dollars) AS INT) AS total_amount_of_fines_in_dollars_min
    , CAST(MAX(total_amount_of_fines_in_dollars) AS INT) AS total_amount_of_fines_in_dollars_max
    , RANK() OVER (PARTITION BY AVG(total_amount_of_fines_in_dollars) IS NOT NULL, state_id ORDER BY AVG(total_amount_of_fines_in_dollars)) AS total_amount_of_fines_in_dollars_rank

    , CAST(AVG(number_of_payment_denials) AS REAL) AS number_of_payment_denials_avg
    , CAST(SUM(number_of_payment_denials) AS INT) AS number_of_payment_denials_sum
    , CAST(MIN(number_of_payment_denials) AS INT) AS number_of_payment_denials_min
    , CAST(MAX(number_of_payment_denials) AS INT) AS number_of_payment_denials_max
    , RANK() OVER (PARTITION BY AVG(number_of_payment_denials) IS NOT NULL, state_id ORDER BY AVG(number_of_payment_denials)) AS number_of_payment_denials_rank

    , CAST(AVG(total_number_of_penalties) AS REAL) AS total_number_of_penalties_avg
    , CAST(SUM(total_number_of_penalties) AS INT) AS total_number_of_penalties_sum
    , CAST(MIN(total_number_of_penalties) AS INT) AS total_number_of_penalties_min
    , CAST(MAX(total_number_of_penalties) AS INT) AS total_number_of_penalties_max
    , RANK() OVER (PARTITION BY AVG(total_number_of_penalties) IS NOT NULL, state_id ORDER BY AVG(total_number_of_penalties)) AS total_number_of_penalties_rank

    , CAST(AVG(cycle_1_total_number_of_health_deficiencies) AS REAL) AS cycle_1_total_number_of_health_deficiencies_avg
    , CAST(SUM(cycle_1_total_number_of_health_deficiencies) AS INT) AS cycle_1_total_number_of_health_deficiencies_sum
    , CAST(MIN(cycle_1_total_number_of_health_deficiencies) AS INT) AS cycle_1_total_number_of_health_deficiencies_min
    , CAST(MAX(cycle_1_total_number_of_health_deficiencies) AS INT) AS cycle_1_total_number_of_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_total_number_of_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_1_total_number_of_health_deficiencies)) AS cycle_1_total_number_of_health_deficiencies_rank

    , CAST(AVG(cycle_1_number_of_standard_health_deficiencies) AS REAL) AS cycle_1_number_of_standard_health_deficiencies_avg
    , CAST(SUM(cycle_1_number_of_standard_health_deficiencies) AS INT) AS cycle_1_number_of_standard_health_deficiencies_sum
    , CAST(MIN(cycle_1_number_of_standard_health_deficiencies) AS INT) AS cycle_1_number_of_standard_health_deficiencies_min
    , CAST(MAX(cycle_1_number_of_standard_health_deficiencies) AS INT) AS cycle_1_number_of_standard_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_number_of_standard_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_1_number_of_standard_health_deficiencies)) AS cycle_1_number_of_standard_health_deficiencies_rank

    , CAST(AVG(cycle_1_number_of_complaint_health_deficiencies) AS REAL) AS cycle_1_number_of_complaint_health_deficiencies_avg
    , CAST(SUM(cycle_1_number_of_complaint_health_deficiencies) AS INT) AS cycle_1_number_of_complaint_health_deficiencies_sum
    , CAST(MIN(cycle_1_number_of_complaint_health_deficiencies) AS INT) AS cycle_1_number_of_complaint_health_deficiencies_min
    , CAST(MAX(cycle_1_number_of_complaint_health_deficiencies) AS INT) AS cycle_1_number_of_complaint_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_number_of_complaint_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_1_number_of_complaint_health_deficiencies)) AS cycle_1_number_of_complaint_health_deficiencies_rank

    , CAST(AVG(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_avg
    , CAST(SUM(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_sum
    , CAST(MIN(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_min
    , CAST(MAX(cycle_1_health_deficiency_score) AS REAL) AS cycle_1_health_deficiency_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_health_deficiency_score) IS NOT NULL, state_id ORDER BY AVG(cycle_1_health_deficiency_score)) AS cycle_1_health_deficiency_score_rank

    , CAST(AVG(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_avg
    , CAST(SUM(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_sum
    , CAST(MIN(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_min
    , CAST(MAX(cycle_1_number_of_health_revisits) AS REAL) AS cycle_1_number_of_health_revisits_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_number_of_health_revisits) IS NOT NULL, state_id ORDER BY AVG(cycle_1_number_of_health_revisits)) AS cycle_1_number_of_health_revisits_rank

    , CAST(AVG(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_avg
    , CAST(SUM(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_sum
    , CAST(MIN(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_min
    , CAST(MAX(cycle_1_health_revisit_score) AS REAL) AS cycle_1_health_revisit_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_health_revisit_score) IS NOT NULL, state_id ORDER BY AVG(cycle_1_health_revisit_score)) AS cycle_1_health_revisit_score_rank

    , CAST(AVG(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_avg
    , CAST(SUM(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_sum
    , CAST(MIN(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_min
    , CAST(MAX(cycle_1_total_health_score) AS REAL) AS cycle_1_total_health_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_1_total_health_score) IS NOT NULL, state_id ORDER BY AVG(cycle_1_total_health_score)) AS cycle_1_total_health_score_rank

    , CAST(AVG(cycle_2_total_number_of_health_deficiencies) AS REAL) AS cycle_2_total_number_of_health_deficiencies_avg
    , CAST(SUM(cycle_2_total_number_of_health_deficiencies) AS INT) AS cycle_2_total_number_of_health_deficiencies_sum
    , CAST(MIN(cycle_2_total_number_of_health_deficiencies) AS INT) AS cycle_2_total_number_of_health_deficiencies_min
    , CAST(MAX(cycle_2_total_number_of_health_deficiencies) AS INT) AS cycle_2_total_number_of_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_total_number_of_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_2_total_number_of_health_deficiencies)) AS cycle_2_total_number_of_health_deficiencies_rank

    , CAST(AVG(cycle_2_number_of_standard_health_deficiencies) AS REAL) AS cycle_2_number_of_standard_health_deficiencies_avg
    , CAST(SUM(cycle_2_number_of_standard_health_deficiencies) AS INT) AS cycle_2_number_of_standard_health_deficiencies_sum
    , CAST(MIN(cycle_2_number_of_standard_health_deficiencies) AS INT) AS cycle_2_number_of_standard_health_deficiencies_min
    , CAST(MAX(cycle_2_number_of_standard_health_deficiencies) AS INT) AS cycle_2_number_of_standard_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_number_of_standard_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_2_number_of_standard_health_deficiencies)) AS cycle_2_number_of_standard_health_deficiencies_rank

    , CAST(AVG(cycle_2_number_of_complaint_health_deficiencies) AS REAL) AS cycle_2_number_of_complaint_health_deficiencies_avg
    , CAST(SUM(cycle_2_number_of_complaint_health_deficiencies) AS INT) AS cycle_2_number_of_complaint_health_deficiencies_sum
    , CAST(MIN(cycle_2_number_of_complaint_health_deficiencies) AS INT) AS cycle_2_number_of_complaint_health_deficiencies_min
    , CAST(MAX(cycle_2_number_of_complaint_health_deficiencies) AS INT) AS cycle_2_number_of_complaint_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_number_of_complaint_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_2_number_of_complaint_health_deficiencies)) AS cycle_2_number_of_complaint_health_deficiencies_rank

    , CAST(AVG(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_avg
    , CAST(SUM(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_sum
    , CAST(MIN(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_min
    , CAST(MAX(cycle_2_health_deficiency_score) AS REAL) AS cycle_2_health_deficiency_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_health_deficiency_score) IS NOT NULL, state_id ORDER BY AVG(cycle_2_health_deficiency_score)) AS cycle_2_health_deficiency_score_rank

    , CAST(AVG(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_avg
    , CAST(SUM(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_sum
    , CAST(MIN(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_min
    , CAST(MAX(cycle_2_number_of_health_revisits) AS REAL) AS cycle_2_number_of_health_revisits_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_number_of_health_revisits) IS NOT NULL, state_id ORDER BY AVG(cycle_2_number_of_health_revisits)) AS cycle_2_number_of_health_revisits_rank

    , CAST(AVG(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_avg
    , CAST(SUM(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_sum
    , CAST(MIN(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_min
    , CAST(MAX(cycle_2_health_revisit_score) AS REAL) AS cycle_2_health_revisit_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_health_revisit_score) IS NOT NULL, state_id ORDER BY AVG(cycle_2_health_revisit_score)) AS cycle_2_health_revisit_score_rank

    , CAST(AVG(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_avg
    , CAST(SUM(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_sum
    , CAST(MIN(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_min
    , CAST(MAX(cycle_2_total_health_score) AS REAL) AS cycle_2_total_health_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_2_total_health_score) IS NOT NULL, state_id ORDER BY AVG(cycle_2_total_health_score)) AS cycle_2_total_health_score_rank

    , CAST(AVG(cycle_3_total_number_of_health_deficiencies) AS REAL) AS cycle_3_total_number_of_health_deficiencies_avg
    , CAST(SUM(cycle_3_total_number_of_health_deficiencies) AS INT) AS cycle_3_total_number_of_health_deficiencies_sum
    , CAST(MIN(cycle_3_total_number_of_health_deficiencies) AS INT) AS cycle_3_total_number_of_health_deficiencies_min
    , CAST(MAX(cycle_3_total_number_of_health_deficiencies) AS INT) AS cycle_3_total_number_of_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_total_number_of_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_3_total_number_of_health_deficiencies)) AS cycle_3_total_number_of_health_deficiencies_rank

    , CAST(AVG(cycle_3_number_of_standard_health_deficiencies) AS REAL) AS cycle_3_number_of_standard_health_deficiencies_avg
    , CAST(SUM(cycle_3_number_of_standard_health_deficiencies) AS INT) AS cycle_3_number_of_standard_health_deficiencies_sum
    , CAST(MIN(cycle_3_number_of_standard_health_deficiencies) AS INT) AS cycle_3_number_of_standard_health_deficiencies_min
    , CAST(MAX(cycle_3_number_of_standard_health_deficiencies) AS INT) AS cycle_3_number_of_standard_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_number_of_standard_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_3_number_of_standard_health_deficiencies)) AS cycle_3_number_of_standard_health_deficiencies_rank

    , CAST(AVG(cycle_3_number_of_complaint_health_deficiencies) AS REAL) AS cycle_3_number_of_complaint_health_deficiencies_avg
    , CAST(SUM(cycle_3_number_of_complaint_health_deficiencies) AS INT) AS cycle_3_number_of_complaint_health_deficiencies_sum
    , CAST(MIN(cycle_3_number_of_complaint_health_deficiencies) AS INT) AS cycle_3_number_of_complaint_health_deficiencies_min
    , CAST(MAX(cycle_3_number_of_complaint_health_deficiencies) AS INT) AS cycle_3_number_of_complaint_health_deficiencies_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_number_of_complaint_health_deficiencies) IS NOT NULL, state_id ORDER BY AVG(cycle_3_number_of_complaint_health_deficiencies)) AS cycle_3_number_of_complaint_health_deficiencies_rank

    , CAST(AVG(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_avg
    , CAST(SUM(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_sum
    , CAST(MIN(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_min
    , CAST(MAX(cycle_3_health_deficiency_score) AS REAL) AS cycle_3_health_deficiency_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_health_deficiency_score) IS NOT NULL, state_id ORDER BY AVG(cycle_3_health_deficiency_score)) AS cycle_3_health_deficiency_score_rank

    , CAST(AVG(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_avg
    , CAST(SUM(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_sum
    , CAST(MIN(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_min
    , CAST(MAX(cycle_3_number_of_health_revisits) AS REAL) AS cycle_3_number_of_health_revisits_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_number_of_health_revisits) IS NOT NULL, state_id ORDER BY AVG(cycle_3_number_of_health_revisits)) AS cycle_3_number_of_health_revisits_rank

    , CAST(AVG(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_avg
    , CAST(SUM(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_sum
    , CAST(MIN(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_min
    , CAST(MAX(cycle_3_health_revisit_score) AS REAL) AS cycle_3_health_revisit_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_health_revisit_score) IS NOT NULL, state_id ORDER BY AVG(cycle_3_health_revisit_score)) AS cycle_3_health_revisit_score_rank

    , CAST(AVG(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_avg
    , CAST(SUM(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_sum
    , CAST(MIN(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_min
    , CAST(MAX(cycle_3_total_health_score) AS REAL) AS cycle_3_total_health_score_max
    , RANK() OVER (PARTITION BY AVG(cycle_3_total_health_score) IS NOT NULL, state_id ORDER BY AVG(cycle_3_total_health_score)) AS cycle_3_total_health_score_rank

FROM public.survey s
    INNER JOIN public.providers p ON p.provnum = s.provnum
GROUP BY state_id, city_id
ORDER BY state_id, city_id;



/*
SELECT * FROM summary.survey_nation;
SELECT * FROM summary.survey_state;
SELECT * FROM summary.survey_county;
SELECT * FROM summary.survey_city;



SELECT AVG(NULLIF(total_amount_of_fines_in_dollars, 0))
FROM public.survey;

*/