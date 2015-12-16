

-- ----------------------------------------
-- 
--  POPULATE "survey" TABLE
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS public.survey;

CREATE TABLE public.survey (
    provnum text NOT NULL

    , total_weighted_health_survey_score REAL
    , total_weighted_health_survey_score_rank_nation INT
    , total_weighted_health_survey_score_rank_state INT
    , total_weighted_health_survey_score_rank_county INT
    , total_weighted_health_survey_score_rank_city INT
    
    , number_of_facility_reported_incidents INT
    , number_of_facility_reported_incidents_rank_nation INT
    , number_of_facility_reported_incidents_rank_state INT
    , number_of_facility_reported_incidents_rank_county INT
    , number_of_facility_reported_incidents_rank_city INT

    , number_of_substantiated_complaints INT
    , number_of_substantiated_complaints_rank_nation INT
    , number_of_substantiated_complaints_rank_state INT
    , number_of_substantiated_complaints_rank_county INT
    , number_of_substantiated_complaints_rank_city INT


    , number_of_fines INT
    , number_of_fines_rank_nation INT
    , number_of_fines_rank_state INT
    , number_of_fines_rank_county INT
    , number_of_fines_rank_city INT

    , total_amount_of_fines_in_dollars INT
    , total_amount_of_fines_in_dollars_rank_nation INT
    , total_amount_of_fines_in_dollars_rank_state INT
    , total_amount_of_fines_in_dollars_rank_county INT
    , total_amount_of_fines_in_dollars_rank_city INT

    , number_of_payment_denials INT
    , number_of_payment_denials_rank_nation INT
    , number_of_payment_denials_rank_state INT
    , number_of_payment_denials_rank_county INT
    , number_of_payment_denials_rank_city INT

    , total_number_of_penalties INT
    , total_number_of_penalties_rank_nation INT
    , total_number_of_penalties_rank_state INT
    , total_number_of_penalties_rank_county INT
    , total_number_of_penalties_rank_city INT

    
    , cycle_1_standard_survey_health_date DATE
    , cycle_1_total_number_of_health_deficiencies INT
    , cycle_1_total_number_of_health_deficiencies_rank_nation INT
    , cycle_1_total_number_of_health_deficiencies_rank_state INT
    , cycle_1_total_number_of_health_deficiencies_rank_county INT
    , cycle_1_total_number_of_health_deficiencies_rank_city INT

    , cycle_1_number_of_standard_health_deficiencies INT
    , cycle_1_number_of_standard_health_deficiencies_rank_nation INT
    , cycle_1_number_of_standard_health_deficiencies_rank_state INT
    , cycle_1_number_of_standard_health_deficiencies_rank_county INT
    , cycle_1_number_of_standard_health_deficiencies_rank_city INT

    , cycle_1_number_of_complaint_health_deficiencies INT
    , cycle_1_number_of_complaint_health_deficiencies_rank_nation INT
    , cycle_1_number_of_complaint_health_deficiencies_rank_state INT
    , cycle_1_number_of_complaint_health_deficiencies_rank_county INT
    , cycle_1_number_of_complaint_health_deficiencies_rank_city INT

    , cycle_1_health_deficiency_score INT
    , cycle_1_health_deficiency_score_rank_nation INT
    , cycle_1_health_deficiency_score_rank_state INT
    , cycle_1_health_deficiency_score_rank_county INT
    , cycle_1_health_deficiency_score_rank_city INT

    , cycle_1_number_of_health_revisits INT
    , cycle_1_number_of_health_revisits_rank_nation INT
    , cycle_1_number_of_health_revisits_rank_state INT
    , cycle_1_number_of_health_revisits_rank_county INT
    , cycle_1_number_of_health_revisits_rank_city INT

    , cycle_1_health_revisit_score INT
    , cycle_1_health_revisit_score_rank_nation INT
    , cycle_1_health_revisit_score_rank_state INT
    , cycle_1_health_revisit_score_rank_county INT
    , cycle_1_health_revisit_score_rank_city INT

    , cycle_1_total_health_score INT
    , cycle_1_total_health_score_rank_nation INT
    , cycle_1_total_health_score_rank_state INT
    , cycle_1_total_health_score_rank_county INT
    , cycle_1_total_health_score_rank_city INT


    , cycle_2_standard_health_survey_date DATE
    , cycle_2_total_number_of_health_deficiencies INT
    , cycle_2_total_number_of_health_deficiencies_rank_nation INT
    , cycle_2_total_number_of_health_deficiencies_rank_state INT
    , cycle_2_total_number_of_health_deficiencies_rank_county INT
    , cycle_2_total_number_of_health_deficiencies_rank_city INT

    , cycle_2_number_of_standard_health_deficiencies INT
    , cycle_2_number_of_standard_health_deficiencies_rank_nation INT
    , cycle_2_number_of_standard_health_deficiencies_rank_state INT
    , cycle_2_number_of_standard_health_deficiencies_rank_county INT
    , cycle_2_number_of_standard_health_deficiencies_rank_city INT

    , cycle_2_number_of_complaint_health_deficiencies INT
    , cycle_2_number_of_complaint_health_deficiencies_rank_nation INT
    , cycle_2_number_of_complaint_health_deficiencies_rank_state INT
    , cycle_2_number_of_complaint_health_deficiencies_rank_county INT
    , cycle_2_number_of_complaint_health_deficiencies_rank_city INT

    , cycle_2_health_deficiency_score INT
    , cycle_2_health_deficiency_score_rank_nation INT
    , cycle_2_health_deficiency_score_rank_state INT
    , cycle_2_health_deficiency_score_rank_county INT
    , cycle_2_health_deficiency_score_rank_city INT

    , cycle_2_number_of_health_revisits INT
    , cycle_2_number_of_health_revisits_rank_nation INT
    , cycle_2_number_of_health_revisits_rank_state INT
    , cycle_2_number_of_health_revisits_rank_county INT
    , cycle_2_number_of_health_revisits_rank_city INT

    , cycle_2_health_revisit_score INT
    , cycle_2_health_revisit_score_rank_nation INT
    , cycle_2_health_revisit_score_rank_state INT
    , cycle_2_health_revisit_score_rank_county INT
    , cycle_2_health_revisit_score_rank_city INT

    , cycle_2_total_health_score INT
    , cycle_2_total_health_score_rank_nation INT
    , cycle_2_total_health_score_rank_state INT
    , cycle_2_total_health_score_rank_county INT
    , cycle_2_total_health_score_rank_city INT


    , cycle_3_standard_health_survey_date DATE
    , cycle_3_total_number_of_health_deficiencies INT
    , cycle_3_total_number_of_health_deficiencies_rank_nation INT
    , cycle_3_total_number_of_health_deficiencies_rank_state INT
    , cycle_3_total_number_of_health_deficiencies_rank_county INT
    , cycle_3_total_number_of_health_deficiencies_rank_city INT

    , cycle_3_number_of_standard_health_deficiencies INT
    , cycle_3_number_of_standard_health_deficiencies_rank_nation INT
    , cycle_3_number_of_standard_health_deficiencies_rank_state INT
    , cycle_3_number_of_standard_health_deficiencies_rank_county INT
    , cycle_3_number_of_standard_health_deficiencies_rank_city INT

    , cycle_3_number_of_complaint_health_deficiencies INT
    , cycle_3_number_of_complaint_health_deficiencies_rank_nation INT
    , cycle_3_number_of_complaint_health_deficiencies_rank_state INT
    , cycle_3_number_of_complaint_health_deficiencies_rank_county INT
    , cycle_3_number_of_complaint_health_deficiencies_rank_city INT

    , cycle_3_health_deficiency_score INT
    , cycle_3_health_deficiency_score_rank_nation INT
    , cycle_3_health_deficiency_score_rank_state INT
    , cycle_3_health_deficiency_score_rank_county INT
    , cycle_3_health_deficiency_score_rank_city INT

    , cycle_3_number_of_health_revisits INT
    , cycle_3_number_of_health_revisits_rank_nation INT
    , cycle_3_number_of_health_revisits_rank_state INT
    , cycle_3_number_of_health_revisits_rank_county INT
    , cycle_3_number_of_health_revisits_rank_city INT

    , cycle_3_health_revisit_score INT
    , cycle_3_health_revisit_score_rank_nation INT
    , cycle_3_health_revisit_score_rank_state INT
    , cycle_3_health_revisit_score_rank_county INT
    , cycle_3_health_revisit_score_rank_city INT

    , cycle_3_total_health_score INT
    , cycle_3_total_health_score_rank_nation INT
    , cycle_3_total_health_score_rank_state INT
    , cycle_3_total_health_score_rank_county INT
    , cycle_3_total_health_score_rank_city INT

    
    , CONSTRAINT pk_survey PRIMARY KEY (provnum)
);

INSERT INTO public.survey
SELECT
    federal_provider_number AS provnum
    
    , CAST(total_weighted_health_survey_score AS DECIMAL(7,3)) AS total_weighted_health_survey_score
    , RANK() OVER (PARTITION BY total_weighted_health_survey_score IS NOT NULL ORDER BY total_weighted_health_survey_score) AS total_weighted_health_survey_score_rank
    , RANK() OVER (PARTITION BY total_weighted_health_survey_score IS NOT NULL, state_id ORDER BY total_weighted_health_survey_score) AS total_weighted_health_survey_score_rank_state
    , RANK() OVER (PARTITION BY total_weighted_health_survey_score IS NOT NULL, state_id, county_id ORDER BY total_weighted_health_survey_score) AS total_weighted_health_survey_score_rank_county
    , RANK() OVER (PARTITION BY total_weighted_health_survey_score IS NOT NULL, state_id, city_id ORDER BY total_weighted_health_survey_score) AS total_weighted_health_survey_score_rank_city
    
    , CAST(number_of_facility_reported_incidents AS INT) AS number_of_facility_reported_incidents
    , RANK() OVER (PARTITION BY number_of_facility_reported_incidents IS NOT NULL ORDER BY number_of_facility_reported_incidents) AS number_of_facility_reported_incidents_rank
    , RANK() OVER (PARTITION BY number_of_facility_reported_incidents IS NOT NULL, state_id ORDER BY number_of_facility_reported_incidents) AS number_of_facility_reported_incidents_rank_state
    , RANK() OVER (PARTITION BY number_of_facility_reported_incidents IS NOT NULL, state_id, county_id ORDER BY number_of_facility_reported_incidents) AS number_of_facility_reported_incidents_rank_county
    , RANK() OVER (PARTITION BY number_of_facility_reported_incidents IS NOT NULL, state_id, city_id ORDER BY number_of_facility_reported_incidents) AS number_of_facility_reported_incidents_rank_city

    , CAST(number_of_substantiated_complaints AS INT) AS number_of_substantiated_complaints
    , RANK() OVER (PARTITION BY number_of_substantiated_complaints IS NOT NULL ORDER BY number_of_substantiated_complaints) AS number_of_substantiated_complaints_rank
    , RANK() OVER (PARTITION BY number_of_substantiated_complaints IS NOT NULL, state_id ORDER BY number_of_substantiated_complaints) AS number_of_substantiated_complaints_rank_state
    , RANK() OVER (PARTITION BY number_of_substantiated_complaints IS NOT NULL, state_id, county_id ORDER BY number_of_substantiated_complaints) AS number_of_substantiated_complaints_rank_county
    , RANK() OVER (PARTITION BY number_of_substantiated_complaints IS NOT NULL, state_id, city_id ORDER BY number_of_substantiated_complaints) AS number_of_substantiated_complaints_rank_city

    
    , CAST(number_of_fines AS INT) AS number_of_fines   
    , RANK() OVER (PARTITION BY number_of_fines IS NOT NULL ORDER BY number_of_fines) AS number_of_fines_rank
    , RANK() OVER (PARTITION BY number_of_fines IS NOT NULL, state_id ORDER BY number_of_fines) AS number_of_fines_rank_state
    , RANK() OVER (PARTITION BY number_of_fines IS NOT NULL, state_id, county_id ORDER BY number_of_fines) AS number_of_fines_rank_county
    , RANK() OVER (PARTITION BY number_of_fines IS NOT NULL, state_id, city_id ORDER BY number_of_fines) AS number_of_fines_rank_city

    , CAST(CAST(total_amount_of_fines_in_dollars AS MONEY) AS DECIMAL) AS total_amount_of_fines_in_dollars
    , RANK() OVER (PARTITION BY total_amount_of_fines_in_dollars IS NOT NULL ORDER BY total_amount_of_fines_in_dollars) AS total_amount_of_fines_in_dollars_rank
    , RANK() OVER (PARTITION BY total_amount_of_fines_in_dollars IS NOT NULL, state_id ORDER BY total_amount_of_fines_in_dollars) AS total_amount_of_fines_in_dollars_rank_state
    , RANK() OVER (PARTITION BY total_amount_of_fines_in_dollars IS NOT NULL, state_id, county_id ORDER BY total_amount_of_fines_in_dollars) AS total_amount_of_fines_in_dollars_rank_county
    , RANK() OVER (PARTITION BY total_amount_of_fines_in_dollars IS NOT NULL, state_id, city_id ORDER BY total_amount_of_fines_in_dollars) AS total_amount_of_fines_in_dollars_rank_city
    
    , CAST(number_of_payment_denials AS INT) AS number_of_payment_denials   
    , RANK() OVER (PARTITION BY number_of_payment_denials IS NOT NULL ORDER BY number_of_payment_denials) AS number_of_payment_denials_rank
    , RANK() OVER (PARTITION BY number_of_payment_denials IS NOT NULL, state_id ORDER BY number_of_payment_denials) AS number_of_payment_denials_rank_state
    , RANK() OVER (PARTITION BY number_of_payment_denials IS NOT NULL, state_id, county_id ORDER BY number_of_payment_denials) AS number_of_payment_denials_rank_county
    , RANK() OVER (PARTITION BY number_of_payment_denials IS NOT NULL, state_id, city_id ORDER BY number_of_payment_denials) AS number_of_payment_denials_rank_city

    , CAST(total_number_of_penalties AS INT) total_number_of_penalties
    , RANK() OVER (PARTITION BY total_number_of_penalties IS NOT NULL ORDER BY total_number_of_penalties) AS total_number_of_penalties_rank
    , RANK() OVER (PARTITION BY total_number_of_penalties IS NOT NULL, state_id ORDER BY total_number_of_penalties) AS total_number_of_penalties_rank_state
    , RANK() OVER (PARTITION BY total_number_of_penalties IS NOT NULL, state_id, county_id ORDER BY total_number_of_penalties) AS total_number_of_penalties_rank_county
    , RANK() OVER (PARTITION BY total_number_of_penalties IS NOT NULL, state_id, city_id ORDER BY total_number_of_penalties) AS total_number_of_penalties_rank_city

    
    , CAST(cycle_1_standard_survey_health_date AS DATE) AS cycle_1_standard_survey_health_date
    , CAST(cycle_1_total_number_of_health_deficiencies AS INT) AS cycle_1_total_number_of_health_deficiencies
    , RANK() OVER (PARTITION BY cycle_1_total_number_of_health_deficiencies IS NOT NULL ORDER BY cycle_1_total_number_of_health_deficiencies) AS cycle_1_total_number_of_health_deficiencies_rank
    , RANK() OVER (PARTITION BY cycle_1_total_number_of_health_deficiencies IS NOT NULL, state_id ORDER BY cycle_1_total_number_of_health_deficiencies) AS cycle_1_total_number_of_health_deficiencies_rank_state
    , RANK() OVER (PARTITION BY cycle_1_total_number_of_health_deficiencies IS NOT NULL, state_id, county_id ORDER BY cycle_1_total_number_of_health_deficiencies) AS cycle_1_total_number_of_health_deficiencies_rank_county
    , RANK() OVER (PARTITION BY cycle_1_total_number_of_health_deficiencies IS NOT NULL, state_id, city_id ORDER BY cycle_1_total_number_of_health_deficiencies) AS cycle_1_total_number_of_health_deficiencies_rank_city

    , CAST(cycle_1_number_of_standard_health_deficiencies AS INT) AS cycle_1_number_of_standard_health_deficiencies
    , RANK() OVER (PARTITION BY cycle_1_number_of_standard_health_deficiencies IS NOT NULL ORDER BY cycle_1_number_of_standard_health_deficiencies) AS cycle_1_number_of_standard_health_deficiencies_rank
    , RANK() OVER (PARTITION BY cycle_1_number_of_standard_health_deficiencies IS NOT NULL, state_id ORDER BY cycle_1_number_of_standard_health_deficiencies) AS cycle_1_number_of_standard_health_deficiencies_rank_state
    , RANK() OVER (PARTITION BY cycle_1_number_of_standard_health_deficiencies IS NOT NULL, state_id, county_id ORDER BY cycle_1_number_of_standard_health_deficiencies) AS cycle_1_number_of_standard_health_deficiencies_rank_county
    , RANK() OVER (PARTITION BY cycle_1_number_of_standard_health_deficiencies IS NOT NULL, state_id, city_id ORDER BY cycle_1_number_of_standard_health_deficiencies) AS cycle_1_number_of_standard_health_deficiencies_rank_city

    , CAST(cycle_1_number_of_complaint_health_deficiencies AS INT) AS cycle_1_number_of_complaint_health_deficiencies
    , RANK() OVER (PARTITION BY cycle_1_number_of_complaint_health_deficiencies IS NOT NULL ORDER BY cycle_1_number_of_complaint_health_deficiencies) AS cycle_1_number_of_complaint_health_deficiencies_rank
    , RANK() OVER (PARTITION BY cycle_1_number_of_complaint_health_deficiencies IS NOT NULL, state_id ORDER BY cycle_1_number_of_complaint_health_deficiencies) AS cycle_1_number_of_complaint_health_deficiencies_rank_state
    , RANK() OVER (PARTITION BY cycle_1_number_of_complaint_health_deficiencies IS NOT NULL, state_id, county_id ORDER BY cycle_1_number_of_complaint_health_deficiencies) AS cycle_1_number_of_complaint_health_deficiencies_rank_county
    , RANK() OVER (PARTITION BY cycle_1_number_of_complaint_health_deficiencies IS NOT NULL, state_id, city_id ORDER BY cycle_1_number_of_complaint_health_deficiencies) AS cycle_1_number_of_complaint_health_deficiencies_rank_city

    , CAST(cycle_1_health_deficiency_score AS INT) AS cycle_1_health_deficiency_score
    , RANK() OVER (PARTITION BY cycle_1_health_deficiency_score IS NOT NULL ORDER BY cycle_1_health_deficiency_score) AS cycle_1_health_deficiency_score_rank
    , RANK() OVER (PARTITION BY cycle_1_health_deficiency_score IS NOT NULL, state_id ORDER BY cycle_1_health_deficiency_score) AS cycle_1_health_deficiency_score_rank_state
    , RANK() OVER (PARTITION BY cycle_1_health_deficiency_score IS NOT NULL, state_id, county_id ORDER BY cycle_1_health_deficiency_score) AS cycle_1_health_deficiency_score_rank_county
    , RANK() OVER (PARTITION BY cycle_1_health_deficiency_score IS NOT NULL, state_id, city_id ORDER BY cycle_1_health_deficiency_score) AS cycle_1_health_deficiency_score_rank_city

    , CAST(cycle_1_number_of_health_revisits AS INT) AS cycle_1_number_of_health_revisits
    , RANK() OVER (PARTITION BY cycle_1_number_of_health_revisits IS NOT NULL ORDER BY cycle_1_number_of_health_revisits) AS cycle_1_number_of_health_revisits_rank
    , RANK() OVER (PARTITION BY cycle_1_number_of_health_revisits IS NOT NULL, state_id ORDER BY cycle_1_number_of_health_revisits) AS cycle_1_number_of_health_revisits_rank_state
    , RANK() OVER (PARTITION BY cycle_1_number_of_health_revisits IS NOT NULL, state_id, county_id ORDER BY cycle_1_number_of_health_revisits) AS cycle_1_number_of_health_revisits_rank_county
    , RANK() OVER (PARTITION BY cycle_1_number_of_health_revisits IS NOT NULL, state_id, city_id ORDER BY cycle_1_number_of_health_revisits) AS cycle_1_number_of_health_revisits_rank_city

    , CAST(cycle_1_health_revisit_score AS INT) AS cycle_1_health_revisit_score
    , RANK() OVER (PARTITION BY cycle_1_health_revisit_score IS NOT NULL ORDER BY cycle_1_health_revisit_score) AS cycle_1_health_revisit_score_rank
    , RANK() OVER (PARTITION BY cycle_1_health_revisit_score IS NOT NULL, state_id ORDER BY cycle_1_health_revisit_score) AS cycle_1_health_revisit_score_rank_state
    , RANK() OVER (PARTITION BY cycle_1_health_revisit_score IS NOT NULL, state_id, county_id ORDER BY cycle_1_health_revisit_score) AS cycle_1_health_revisit_score_rank_county
    , RANK() OVER (PARTITION BY cycle_1_health_revisit_score IS NOT NULL, state_id, city_id ORDER BY cycle_1_health_revisit_score) AS cycle_1_health_revisit_score_rank_city

    , CAST(cycle_1_total_health_score AS INT) AS cycle_1_total_health_score
    , RANK() OVER (PARTITION BY cycle_1_total_health_score IS NOT NULL ORDER BY cycle_1_total_health_score) AS cycle_1_total_health_score_rank
    , RANK() OVER (PARTITION BY cycle_1_total_health_score IS NOT NULL, state_id ORDER BY cycle_1_total_health_score) AS cycle_1_total_health_score_rank_state
    , RANK() OVER (PARTITION BY cycle_1_total_health_score IS NOT NULL, state_id, county_id ORDER BY cycle_1_total_health_score) AS cycle_1_total_health_score_rank_county
    , RANK() OVER (PARTITION BY cycle_1_total_health_score IS NOT NULL, state_id, city_id ORDER BY cycle_1_total_health_score) AS cycle_1_total_health_score_rank_city

    
    , CAST(cycle_2_standard_health_survey_date AS DATE) AS cycle_2_standard_health_survey_date
    , CAST(cycle_2_total_number_of_health_deficiencies AS INT) AS cycle_2_total_number_of_health_deficiencies
    , RANK() OVER (PARTITION BY cycle_2_total_number_of_health_deficiencies IS NOT NULL ORDER BY cycle_2_total_number_of_health_deficiencies) AS cycle_2_total_number_of_health_deficiencies_rank
    , RANK() OVER (PARTITION BY cycle_2_total_number_of_health_deficiencies IS NOT NULL, state_id ORDER BY cycle_2_total_number_of_health_deficiencies) AS cycle_2_total_number_of_health_deficiencies_rank_state
    , RANK() OVER (PARTITION BY cycle_2_total_number_of_health_deficiencies IS NOT NULL, state_id, county_id ORDER BY cycle_2_total_number_of_health_deficiencies) AS cycle_2_total_number_of_health_deficiencies_rank_county
    , RANK() OVER (PARTITION BY cycle_2_total_number_of_health_deficiencies IS NOT NULL, state_id, city_id ORDER BY cycle_2_total_number_of_health_deficiencies) AS cycle_2_total_number_of_health_deficiencies_rank_city

    , CAST(cycle_2_number_of_standard_health_deficiencies AS INT) AS cycle_2_number_of_standard_health_deficiencies
    , RANK() OVER (PARTITION BY cycle_2_number_of_standard_health_deficiencies IS NOT NULL ORDER BY cycle_2_number_of_standard_health_deficiencies) AS cycle_2_number_of_standard_health_deficiencies_rank
    , RANK() OVER (PARTITION BY cycle_2_number_of_standard_health_deficiencies IS NOT NULL, state_id ORDER BY cycle_2_number_of_standard_health_deficiencies) AS cycle_2_number_of_standard_health_deficiencies_rank_state
    , RANK() OVER (PARTITION BY cycle_2_number_of_standard_health_deficiencies IS NOT NULL, state_id, county_id ORDER BY cycle_2_number_of_standard_health_deficiencies) AS cycle_2_number_of_standard_health_deficiencies_rank_county
    , RANK() OVER (PARTITION BY cycle_2_number_of_standard_health_deficiencies IS NOT NULL, state_id, city_id ORDER BY cycle_2_number_of_standard_health_deficiencies) AS cycle_2_number_of_standard_health_deficiencies_rank_city

    , CAST(cycle_2_number_of_complaint_health_deficiencies AS INT) AS cycle_2_number_of_complaint_health_deficiencies
    , RANK() OVER (PARTITION BY cycle_2_number_of_complaint_health_deficiencies IS NOT NULL ORDER BY cycle_2_number_of_complaint_health_deficiencies) AS cycle_2_number_of_complaint_health_deficiencies_rank
    , RANK() OVER (PARTITION BY cycle_2_number_of_complaint_health_deficiencies IS NOT NULL, state_id ORDER BY cycle_2_number_of_complaint_health_deficiencies) AS cycle_2_number_of_complaint_health_deficiencies_rank_state
    , RANK() OVER (PARTITION BY cycle_2_number_of_complaint_health_deficiencies IS NOT NULL, state_id, county_id ORDER BY cycle_2_number_of_complaint_health_deficiencies) AS cycle_2_number_of_complaint_health_deficiencies_rank_county
    , RANK() OVER (PARTITION BY cycle_2_number_of_complaint_health_deficiencies IS NOT NULL, state_id, city_id ORDER BY cycle_2_number_of_complaint_health_deficiencies) AS cycle_2_number_of_complaint_health_deficiencies_rank_city

    , CAST(cycle_2_health_deficiency_score AS INT) AS cycle_2_health_deficiency_score
    , RANK() OVER (PARTITION BY cycle_2_health_deficiency_score IS NOT NULL ORDER BY cycle_2_health_deficiency_score) AS cycle_2_health_deficiency_score_rank
    , RANK() OVER (PARTITION BY cycle_2_health_deficiency_score IS NOT NULL, state_id ORDER BY cycle_2_health_deficiency_score) AS cycle_2_health_deficiency_score_rank_state
    , RANK() OVER (PARTITION BY cycle_2_health_deficiency_score IS NOT NULL, state_id, county_id ORDER BY cycle_2_health_deficiency_score) AS cycle_2_health_deficiency_score_rank_county
    , RANK() OVER (PARTITION BY cycle_2_health_deficiency_score IS NOT NULL, state_id, city_id ORDER BY cycle_2_health_deficiency_score) AS cycle_2_health_deficiency_score_rank_city

    , CAST(cycle_2_number_of_health_revisits AS INT) AS cycle_2_number_of_health_revisits
    , RANK() OVER (PARTITION BY cycle_2_number_of_health_revisits IS NOT NULL ORDER BY cycle_2_number_of_health_revisits) AS cycle_2_number_of_health_revisits_rank
    , RANK() OVER (PARTITION BY cycle_2_number_of_health_revisits IS NOT NULL, state_id ORDER BY cycle_2_number_of_health_revisits) AS cycle_2_number_of_health_revisits_rank_state
    , RANK() OVER (PARTITION BY cycle_2_number_of_health_revisits IS NOT NULL, state_id, county_id ORDER BY cycle_2_number_of_health_revisits) AS cycle_2_number_of_health_revisits_rank_county
    , RANK() OVER (PARTITION BY cycle_2_number_of_health_revisits IS NOT NULL, state_id, city_id ORDER BY cycle_2_number_of_health_revisits) AS cycle_2_number_of_health_revisits_rank_city

    , CAST(cycle_2_health_revisit_score AS INT) AS cycle_2_health_revisit_score
    , RANK() OVER (PARTITION BY cycle_2_health_revisit_score IS NOT NULL ORDER BY cycle_2_health_revisit_score) AS cycle_2_health_revisit_score_rank
    , RANK() OVER (PARTITION BY cycle_2_health_revisit_score IS NOT NULL, state_id ORDER BY cycle_2_health_revisit_score) AS cycle_2_health_revisit_score_rank_state
    , RANK() OVER (PARTITION BY cycle_2_health_revisit_score IS NOT NULL, state_id, county_id ORDER BY cycle_2_health_revisit_score) AS cycle_2_health_revisit_score_rank_county
    , RANK() OVER (PARTITION BY cycle_2_health_revisit_score IS NOT NULL, state_id, city_id ORDER BY cycle_2_health_revisit_score) AS cycle_2_health_revisit_score_rank_city

    , CAST(cycle_2_total_health_score AS INT) AS cycle_2_total_health_score
    , RANK() OVER (PARTITION BY cycle_2_total_health_score IS NOT NULL ORDER BY cycle_2_total_health_score) AS cycle_2_total_health_score_rank
    , RANK() OVER (PARTITION BY cycle_2_total_health_score IS NOT NULL, state_id ORDER BY cycle_2_total_health_score) AS cycle_2_total_health_score_rank_state
    , RANK() OVER (PARTITION BY cycle_2_total_health_score IS NOT NULL, state_id, county_id ORDER BY cycle_2_total_health_score) AS cycle_2_total_health_score_rank_county
    , RANK() OVER (PARTITION BY cycle_2_total_health_score IS NOT NULL, state_id, city_id ORDER BY cycle_2_total_health_score) AS cycle_2_total_health_score_rank_city

    
    , CAST(cycle_3_standard_health_survey_date AS DATE) AS cycle_3_standard_health_survey_date
    , CAST(cycle_3_total_number_of_health_deficiencies AS INT) AS cycle_3_total_number_of_health_deficiencies
    , RANK() OVER (PARTITION BY cycle_3_total_number_of_health_deficiencies IS NOT NULL ORDER BY cycle_3_total_number_of_health_deficiencies) AS cycle_3_total_number_of_health_deficiencies_rank
    , RANK() OVER (PARTITION BY cycle_3_total_number_of_health_deficiencies IS NOT NULL, state_id ORDER BY cycle_3_total_number_of_health_deficiencies) AS cycle_3_total_number_of_health_deficiencies_rank_state
    , RANK() OVER (PARTITION BY cycle_3_total_number_of_health_deficiencies IS NOT NULL, state_id, county_id ORDER BY cycle_3_total_number_of_health_deficiencies) AS cycle_3_total_number_of_health_deficiencies_rank_county
    , RANK() OVER (PARTITION BY cycle_3_total_number_of_health_deficiencies IS NOT NULL, state_id, city_id ORDER BY cycle_3_total_number_of_health_deficiencies) AS cycle_3_total_number_of_health_deficiencies_rank_city

    , CAST(cycle_3_number_of_standard_health_deficiencies AS INT) AS cycle_3_number_of_standard_health_deficiencies
    , RANK() OVER (PARTITION BY cycle_3_number_of_standard_health_deficiencies IS NOT NULL ORDER BY cycle_3_number_of_standard_health_deficiencies) AS cycle_3_number_of_standard_health_deficiencies_rank
    , RANK() OVER (PARTITION BY cycle_3_number_of_standard_health_deficiencies IS NOT NULL, state_id ORDER BY cycle_3_number_of_standard_health_deficiencies) AS cycle_3_number_of_standard_health_deficiencies_rank_state
    , RANK() OVER (PARTITION BY cycle_3_number_of_standard_health_deficiencies IS NOT NULL, state_id, county_id ORDER BY cycle_3_number_of_standard_health_deficiencies) AS cycle_3_number_of_standard_health_deficiencies_rank_county
    , RANK() OVER (PARTITION BY cycle_3_number_of_standard_health_deficiencies IS NOT NULL, state_id, city_id ORDER BY cycle_3_number_of_standard_health_deficiencies) AS cycle_3_number_of_standard_health_deficiencies_rank_city

    , CAST(cycle_3_number_of_complaint_health_deficiencies AS INT) AS cycle_3_number_of_complaint_health_deficiencies
    , RANK() OVER (PARTITION BY cycle_3_number_of_complaint_health_deficiencies IS NOT NULL ORDER BY cycle_3_number_of_complaint_health_deficiencies) AS cycle_3_number_of_complaint_health_deficiencies_rank
    , RANK() OVER (PARTITION BY cycle_3_number_of_complaint_health_deficiencies IS NOT NULL, state_id ORDER BY cycle_3_number_of_complaint_health_deficiencies) AS cycle_3_number_of_complaint_health_deficiencies_rank_state
    , RANK() OVER (PARTITION BY cycle_3_number_of_complaint_health_deficiencies IS NOT NULL, state_id, county_id ORDER BY cycle_3_number_of_complaint_health_deficiencies) AS cycle_3_number_of_complaint_health_deficiencies_rank_county
    , RANK() OVER (PARTITION BY cycle_3_number_of_complaint_health_deficiencies IS NOT NULL, state_id, city_id ORDER BY cycle_3_number_of_complaint_health_deficiencies) AS cycle_3_number_of_complaint_health_deficiencies_rank_city

    , CAST(cycle_3_health_deficiency_score AS INT) AS cycle_3_health_deficiency_score
    , RANK() OVER (PARTITION BY cycle_3_health_deficiency_score IS NOT NULL ORDER BY cycle_3_health_deficiency_score) AS cycle_3_health_deficiency_score_rank
    , RANK() OVER (PARTITION BY cycle_3_health_deficiency_score IS NOT NULL, state_id ORDER BY cycle_3_health_deficiency_score) AS cycle_3_health_deficiency_score_rank_state
    , RANK() OVER (PARTITION BY cycle_3_health_deficiency_score IS NOT NULL, state_id, county_id ORDER BY cycle_3_health_deficiency_score) AS cycle_3_health_deficiency_score_rank_county
    , RANK() OVER (PARTITION BY cycle_3_health_deficiency_score IS NOT NULL, state_id, city_id ORDER BY cycle_3_health_deficiency_score) AS cycle_3_health_deficiency_score_rank_city

    , CAST(cycle_3_number_of_health_revisits AS INT) AS cycle_3_number_of_health_revisits
    , RANK() OVER (PARTITION BY cycle_3_number_of_health_revisits IS NOT NULL ORDER BY cycle_3_number_of_health_revisits) AS cycle_3_number_of_health_revisits_rank
    , RANK() OVER (PARTITION BY cycle_3_number_of_health_revisits IS NOT NULL, state_id ORDER BY cycle_3_number_of_health_revisits) AS cycle_3_number_of_health_revisits_rank_state
    , RANK() OVER (PARTITION BY cycle_3_number_of_health_revisits IS NOT NULL, state_id, county_id ORDER BY cycle_3_number_of_health_revisits) AS cycle_3_number_of_health_revisits_rank_county
    , RANK() OVER (PARTITION BY cycle_3_number_of_health_revisits IS NOT NULL, state_id, city_id ORDER BY cycle_3_number_of_health_revisits) AS cycle_3_number_of_health_revisits_rank_city

    , CAST(cycle_3_health_revisit_score AS INT) AS cycle_3_health_revisit_score
    , RANK() OVER (PARTITION BY cycle_3_health_revisit_score IS NOT NULL ORDER BY cycle_3_health_revisit_score) AS cycle_3_health_revisit_score_rank
    , RANK() OVER (PARTITION BY cycle_3_health_revisit_score IS NOT NULL, state_id ORDER BY cycle_3_health_revisit_score) AS cycle_3_health_revisit_score_rank_state
    , RANK() OVER (PARTITION BY cycle_3_health_revisit_score IS NOT NULL, state_id, county_id ORDER BY cycle_3_health_revisit_score) AS cycle_3_health_revisit_score_rank_county
    , RANK() OVER (PARTITION BY cycle_3_health_revisit_score IS NOT NULL, state_id, city_id ORDER BY cycle_3_health_revisit_score) AS cycle_3_health_revisit_score_rank_city

    , CAST(cycle_3_total_health_score AS INT) AS cycle_3_total_health_score
    , RANK() OVER (PARTITION BY cycle_3_total_health_score IS NOT NULL ORDER BY cycle_3_total_health_score) AS cycle_3_total_health_score_rank
    , RANK() OVER (PARTITION BY cycle_3_total_health_score IS NOT NULL, state_id ORDER BY cycle_3_total_health_score) AS cycle_3_total_health_score_rank_state
    , RANK() OVER (PARTITION BY cycle_3_total_health_score IS NOT NULL, state_id, county_id ORDER BY cycle_3_total_health_score) AS cycle_3_total_health_score_rank_county
    , RANK() OVER (PARTITION BY cycle_3_total_health_score IS NOT NULL, state_id, city_id ORDER BY cycle_3_total_health_score) AS cycle_3_total_health_score_rank_city

    
FROM import.raw_4pq5_n9py AS r
    INNER JOIN providers p ON p.provnum = r.federal_provider_number 
ORDER BY provnum;


-- ----------------------------------------
-- 
--      CREATE INDEXES
-- 
-- ----------------------------------------

-- CREATE INDEX idx_providers_extras__ownership ON providers_extras (ownership_type_id) WITH (fillfactor = 100);
-- CREATE INDEX idx_providers_extras__council ON providers_extras (council_type_id) WITH (fillfactor = 100);
-- CREATE INDEX idx_providers_extras__sprinklers ON providers_extras (sprinkler_status_id) WITH (fillfactor = 100);

SELECT *
FROM public.survey
WHERE total_weighted_health_survey_score IS NOT NULL
ORDER BY total_weighted_health_survey_score_rank_nation
LIMIT 10;
/*
*/


/*
SELECT *
FROM public.survey;

SELECT *
FROM import.raw_4pq5_n9py AS r
WHERE total_amount_of_fines_in_dollars LIKE '%.00'

*/