

-- ----------------------------------------
-- 
-- 	POPULATE "ratings" TABLE
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS public.ratings;

CREATE TABLE public.ratings (
	provnum text NOT NULL
	
	, weighted_score DECIMAL(7,3)
	, weighted_score_rank INT
	, weighted_score_rank_pct REAL
	
	, overall INT
	, overall_footnote_id INT
	
	, health_inspection INT
	, health_inspection_footnote_id INT
	
	, quality_measures INT
	, quality_measures_footnote_id INT
	
	, staffing INT
	, staffing_footnote_id INT
	
	, staffing_rn INT
	, staffing_rn_footnote_id INT
	
	, staffing_reported_footnote_id INT
	, staffing_therapy_footnote_id INT
	
	, CONSTRAINT pk_ratings PRIMARY KEY (provnum)
);

INSERT INTO public.ratings
SELECT
	federal_provider_number AS provnum
	
	, CAST(total_weighted_health_survey_score AS DECIMAL(7,3)) AS weighted_score
	, RANK() OVER (
		PARTITION BY total_weighted_health_survey_score IS NOT NULL, p.state_id
		ORDER BY CAST(total_weighted_health_survey_score AS DECIMAL(7,3))
	) AS weighted_score_rank
	, PERCENT_RANK() OVER (
		PARTITION BY total_weighted_health_survey_score IS NOT NULL, p.state_id
		ORDER BY CAST(total_weighted_health_survey_score AS DECIMAL(7,3))
	) AS weighted_score_rank_pct
	
	, CAST(overall_rating AS INT) AS overall
	, fnOverall.id AS overall_footnote_id
	
	, CAST(health_inspection_rating AS INT) AS health_inspection
	, fnInspection.id AS health_inspection_footnote_id
	
	, CAST(qm_rating AS INT) AS quality_measures
	, fnQuality.id AS quality_measures_footnote_id
	
	, CAST(staffing_rating AS INT) AS staffing
	, fnStaffing.id AS staffing_footnote_id
	
	, CAST(rn_staffing_rating AS INT) AS staffing_rn
	, fnStaffingRN.id AS staffing_rn_footnote_id
	
	, fnStaffingReported.id AS staffing_reported_footnote_id
	, fnTherapy.id AS staffing_therapy_footnote_id
	
FROM import.raw_4pq5_n9py AS r
	LEFT JOIN providers p ON r.federal_provider_number = p.provnum
	LEFT JOIN dict.footnotes fnOverall ON fnOverall.label = r.overall_rating_footnote
	LEFT JOIN dict.footnotes fnInspection ON fnInspection.label = r.health_inspection_rating_footnote
	LEFT JOIN dict.footnotes fnQuality ON fnQuality.label = r.qm_rating_footnote
	LEFT JOIN dict.footnotes fnStaffing ON fnStaffing.label = r.staffing_rating_footnote
	LEFT JOIN dict.footnotes fnStaffingRN ON fnStaffingRN.label = r.rn_staffing_rating_footnote
	LEFT JOIN dict.footnotes fnStaffingReported ON fnStaffingReported.label = r.reported_staffing_footnote
	LEFT JOIN dict.footnotes fnTherapy ON fnTherapy.label = r.physical_therapist_staffing_footnote
ORDER BY provnum;


-- ----------------------------------------
-- 
--  	CREATE INDEXES
-- 
-- ----------------------------------------

-- CREATE INDEX idx_providers_extras__ownership ON providers_extras (ownership_type_id) WITH (fillfactor = 100);
-- CREATE INDEX idx_providers_extras__council ON providers_extras (council_type_id) WITH (fillfactor = 100);
-- CREATE INDEX idx_providers_extras__sprinklers ON providers_extras (sprinkler_status_id) WITH (fillfactor = 100);



/*
SELECT *
FROM public.ratings
ORDER BY weighted_score;


SELECT * FROM public.ratings;

SELECT DISTINCT CAST(total_weighted_health_survey_score AS REAL)
FROM import.raw_4pq5_n9py AS r
ORDER BY CAST(total_weighted_health_survey_score AS REAL)

SELECT *	
FROM import.raw_4pq5_n9py AS r
WHERE isNumeric(overall_rating) = 0

*/