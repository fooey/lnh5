/*
SELECT *
FROM staffing
LIMIT 100;
*/



CREATE SCHEMA IF NOT EXISTS summary;


-- ----------------------------------------
-- 
-- 	POPULATE staffing SUMMARIES
-- 
-- ----------------------------------------



-- summary.staffing_nation

DROP TABLE IF EXISTS summary.staffing_nation;


CREATE TABLE summary.staffing_nation (
    cna_reported_avg REAL
    , cna_reported_min REAL
    , cna_reported_max REAL
    
    , cna_expected_avg REAL
    , cna_expected_min REAL
    , cna_expected_max REAL
    
    , cna_adjusted_avg REAL
    , cna_adjusted_min REAL
    , cna_adjusted_max REAL


    , lpn_reported_avg REAL
    , lpn_reported_min REAL
    , lpn_reported_max REAL
    
    , lpn_expected_avg REAL
    , lpn_expected_min REAL
    , lpn_expected_max REAL
    
    , lpn_adjusted_avg REAL
    , lpn_adjusted_min REAL
    , lpn_adjusted_max REAL


    , rn_reported_avg REAL
    , rn_reported_min REAL
    , rn_reported_max REAL
    
    , rn_expected_avg REAL
    , rn_expected_min REAL
    , rn_expected_max REAL
    
    , rn_adjusted_avg REAL
    , rn_adjusted_min REAL
    , rn_adjusted_max REAL


    , licensed_reported_avg REAL
    , licensed_reported_min REAL
    , licensed_reported_max REAL


    , therapist_reported_avg REAL
    , therapist_reported_min REAL
    , therapist_reported_max REAL


    , total_reported_avg REAL
    , total_reported_min REAL
    , total_reported_max REAL
    
    , total_expected_avg REAL
    , total_expected_min REAL
    , total_expected_max REAL
    
    , total_adjusted_avg REAL
    , total_adjusted_min REAL
    , total_adjusted_max REAL
);

INSERT INTO summary.staffing_nation
SELECT
    CAST(AVG(cna_reported) AS REAL) AS cna_reported_avg
    , CAST(MIN(cna_reported) AS REAL) AS cna_reported_min
    , CAST(MAX(cna_reported) AS REAL) AS cna_reported_max
    
    , CAST(AVG(cna_expected) AS REAL) AS cna_expected_avg
    , CAST(MIN(cna_expected) AS REAL) AS cna_expected_min
    , CAST(MAX(cna_expected) AS REAL) AS cna_expected_max
    
    , CAST(AVG(cna_adjusted) AS REAL) AS cna_adjusted_avg
    , CAST(MIN(cna_adjusted) AS REAL) AS cna_adjusted_min
    , CAST(MAX(cna_adjusted) AS REAL) AS cna_adjusted_max


    , CAST(AVG(lpn_reported) AS REAL) AS lpn_reported_avg
    , CAST(MIN(lpn_reported) AS REAL) AS lpn_reported_min
    , CAST(MAX(lpn_reported) AS REAL) AS lpn_reported_max
    
    , CAST(AVG(lpn_expected) AS REAL) AS lpn_expected_avg
    , CAST(MIN(lpn_expected) AS REAL) AS lpn_expected_min
    , CAST(MAX(lpn_expected) AS REAL) AS lpn_expected_max
    
    , CAST(AVG(lpn_adjusted) AS REAL) AS lpn_adjusted_avg
    , CAST(MIN(lpn_adjusted) AS REAL) AS lpn_adjusted_min
    , CAST(MAX(lpn_adjusted) AS REAL) AS lpn_adjusted_max


    , CAST(AVG(rn_reported) AS REAL) AS rn_reported_avg
    , CAST(MIN(rn_reported) AS REAL) AS rn_reported_min
    , CAST(MAX(rn_reported) AS REAL) AS rn_reported_max
    
    , CAST(AVG(rn_expected) AS REAL) AS rn_expected_avg
    , CAST(MIN(rn_expected) AS REAL) AS rn_expected_min
    , CAST(MAX(rn_expected) AS REAL) AS rn_expected_max
    
    , CAST(AVG(rn_adjusted) AS REAL) AS rn_adjusted_avg
    , CAST(MIN(rn_adjusted) AS REAL) AS rn_adjusted_min
    , CAST(MAX(rn_adjusted) AS REAL) AS rn_adjusted_max


    , CAST(AVG(licensed_reported) AS REAL) AS licensed_reported_avg
    , CAST(MIN(licensed_reported) AS REAL) AS licensed_reported_min
    , CAST(MAX(licensed_reported) AS REAL) AS licensed_reported_max


    , CAST(AVG(therapist_reported) AS REAL) AS therapist_reported_avg
    , CAST(MIN(therapist_reported) AS REAL) AS therapist_reported_min
    , CAST(MAX(therapist_reported) AS REAL) AS therapist_reported_max


    , CAST(AVG(total_reported) AS REAL) AS total_reported_avg
    , CAST(MIN(total_reported) AS REAL) AS total_reported_min
    , CAST(MAX(total_reported) AS REAL) AS total_reported_max
    
    , CAST(AVG(total_expected) AS REAL) AS total_expected_avg
    , CAST(MIN(total_expected) AS REAL) AS total_expected_min
    , CAST(MAX(total_expected) AS REAL) AS total_expected_max
    
    , CAST(AVG(total_adjusted) AS REAL) AS total_adjusted_avg
    , CAST(MIN(total_adjusted) AS REAL) AS total_adjusted_min
    , CAST(MAX(total_adjusted) AS REAL) AS total_adjusted_max
    
FROM public.staffing;



-- summary.staffing_state

DROP TABLE IF EXISTS summary.staffing_state;

CREATE TABLE summary.staffing_state (
	state_id INT
	
	, cna_reported_avg REAL
	, cna_reported_min REAL
	, cna_reported_max REAL
	, cna_rank INT
	, cna_rank_pct REAL

	, cna_expected_avg REAL
	, cna_expected_min REAL
	, cna_expected_max REAL

	, cna_adjusted_avg REAL
	, cna_adjusted_min REAL
	, cna_adjusted_max REAL


	, lpn_reported_avg REAL
	, lpn_reported_min REAL
	, lpn_reported_max REAL
	, lpn_rank INT
	, lpn_rank_pct REAL

	, lpn_expected_avg REAL
	, lpn_expected_min REAL
	, lpn_expected_max REAL

	, lpn_adjusted_avg REAL
	, lpn_adjusted_min REAL
	, lpn_adjusted_max REAL


	, rn_reported_avg REAL
	, rn_reported_min REAL
	, rn_reported_max REAL
	, rn_rank INT
	, rn_rank_pct REAL


	, rn_expected_avg REAL
	, rn_expected_min REAL
	, rn_expected_max REAL

	, rn_adjusted_avg REAL
	, rn_adjusted_min REAL
	, rn_adjusted_max REAL


	, licensed_reported_avg REAL
	, licensed_reported_min REAL
	, licensed_reported_max REAL
	, licensed_rank INT
	, licensed_rank_pct REAL



	, therapist_reported_avg REAL
	, therapist_reported_min REAL
	, therapist_reported_max REAL
	, therapist_rank INT
	, therapist_rank_pct REAL



	, total_reported_avg REAL
	, total_reported_min REAL
	, total_reported_max REAL
	, total_rank INT
	, total_rank_pct REAL


	, total_expected_avg REAL
	, total_expected_min REAL
	, total_expected_max REAL

	, total_adjusted_avg REAL
	, total_adjusted_min REAL
	, total_adjusted_max REAL

	, CONSTRAINT pk_summary__staffing_state PRIMARY KEY (state_id)
);

INSERT INTO summary.staffing_state
SELECT
	p.state_id
	
	, CAST(AVG(cna_reported) AS REAL) AS cna_reported_avg
	, CAST(MIN(cna_reported) AS REAL) AS cna_reported_min
	, CAST(MAX(cna_reported) AS REAL) AS cna_reported_max
	, RANK() OVER (PARTITION BY AVG(cna_reported) IS NOT NULL ORDER BY AVG(cna_reported) DESC) AS cna_rank
	, PERCENT_RANK() OVER (PARTITION BY AVG(cna_reported) IS NOT NULL ORDER BY AVG(cna_reported) DESC) AS cna_rank_pct
    
	, CAST(AVG(cna_expected) AS REAL) AS cna_expected_avg
	, CAST(MIN(cna_expected) AS REAL) AS cna_expected_min
	, CAST(MAX(cna_expected) AS REAL) AS cna_expected_max

	, CAST(AVG(cna_adjusted) AS REAL) AS cna_adjusted_avg
	, CAST(MIN(cna_adjusted) AS REAL) AS cna_adjusted_min
	, CAST(MAX(cna_adjusted) AS REAL) AS cna_adjusted_max


	, CAST(AVG(lpn_reported) AS REAL) AS lpn_reported_avg
	, CAST(MIN(lpn_reported) AS REAL) AS lpn_reported_min
	, CAST(MAX(lpn_reported) AS REAL) AS lpn_reported_max
	, RANK() OVER (PARTITION BY AVG(lpn_reported) IS NOT NULL ORDER BY AVG(lpn_reported) DESC) AS lpn_rank
	, PERCENT_RANK() OVER (PARTITION BY AVG(lpn_reported) IS NOT NULL ORDER BY AVG(lpn_reported) DESC) AS lpn_rank_pct

	, CAST(AVG(lpn_expected) AS REAL) AS lpn_expected_avg
	, CAST(MIN(lpn_expected) AS REAL) AS lpn_expected_min
	, CAST(MAX(lpn_expected) AS REAL) AS lpn_expected_max

	, CAST(AVG(lpn_adjusted) AS REAL) AS lpn_adjusted_avg
	, CAST(MIN(lpn_adjusted) AS REAL) AS lpn_adjusted_min
	, CAST(MAX(lpn_adjusted) AS REAL) AS lpn_adjusted_max


	, CAST(AVG(rn_reported) AS REAL) AS rn_reported_avg
	, CAST(MIN(rn_reported) AS REAL) AS rn_reported_min
	, CAST(MAX(rn_reported) AS REAL) AS rn_reported_max
	, RANK() OVER (PARTITION BY AVG(rn_reported) IS NOT NULL ORDER BY AVG(rn_reported) DESC) AS rn_rank
	, PERCENT_RANK() OVER (PARTITION BY AVG(rn_reported) IS NOT NULL ORDER BY AVG(rn_reported) DESC) AS rn_rank_pct

	, CAST(AVG(rn_expected) AS REAL) AS rn_expected_avg
	, CAST(MIN(rn_expected) AS REAL) AS rn_expected_min
	, CAST(MAX(rn_expected) AS REAL) AS rn_expected_max

	, CAST(AVG(rn_adjusted) AS REAL) AS rn_adjusted_avg
	, CAST(MIN(rn_adjusted) AS REAL) AS rn_adjusted_min
	, CAST(MAX(rn_adjusted) AS REAL) AS rn_adjusted_max


	, CAST(AVG(licensed_reported) AS REAL) AS licensed_reported_avg
	, CAST(MIN(licensed_reported) AS REAL) AS licensed_reported_min
	, CAST(MAX(licensed_reported) AS REAL) AS licensed_reported_max
	, RANK() OVER (PARTITION BY AVG(licensed_reported) IS NOT NULL ORDER BY AVG(licensed_reported) DESC) AS licensed_rank
	, PERCENT_RANK() OVER (PARTITION BY AVG(licensed_reported) IS NOT NULL ORDER BY AVG(licensed_reported) DESC) AS licensed_rank_pct


	, CAST(AVG(therapist_reported) AS REAL) AS therapist_reported_avg
	, CAST(MIN(therapist_reported) AS REAL) AS therapist_reported_min
	, CAST(MAX(therapist_reported) AS REAL) AS therapist_reported_max
	, RANK() OVER (PARTITION BY AVG(therapist_reported) IS NOT NULL ORDER BY AVG(therapist_reported) DESC) AS therapist_rank
	, PERCENT_RANK() OVER (PARTITION BY AVG(therapist_reported) IS NOT NULL ORDER BY AVG(therapist_reported) DESC) AS therapist_rank_pct


	, CAST(AVG(total_reported) AS REAL) AS total_reported_avg
	, CAST(MIN(total_reported) AS REAL) AS total_reported_min
	, CAST(MAX(total_reported) AS REAL) AS total_reported_max
	, RANK() OVER (PARTITION BY AVG(total_reported) IS NOT NULL ORDER BY AVG(total_reported) DESC) AS total_rank
	, PERCENT_RANK() OVER (PARTITION BY AVG(total_reported) IS NOT NULL ORDER BY AVG(total_reported) DESC) AS total_rank_pct

	, CAST(AVG(total_expected) AS REAL) AS total_expected_avg
	, CAST(MIN(total_expected) AS REAL) AS total_expected_min
	, CAST(MAX(total_expected) AS REAL) AS total_expected_max

	, CAST(AVG(total_adjusted) AS REAL) AS total_adjusted_avg
	, CAST(MIN(total_adjusted) AS REAL) AS total_adjusted_min
	, CAST(MAX(total_adjusted) AS REAL) AS total_adjusted_max
    
FROM public.staffing s
	INNER JOIN providers p ON p.provnum = s.provnum
GROUP BY state_id
ORDER BY state_id;



-- summary.staffing_city

DROP TABLE IF EXISTS summary.staffing_city;

CREATE TABLE summary.staffing_city (
	state_id INT
	, city_id INT
	
	, cna_reported_avg REAL
	, cna_reported_min REAL
	, cna_reported_max REAL
	, cna_rank INT
	, cna_rank_pct REAL

	, cna_expected_avg REAL
	, cna_expected_min REAL
	, cna_expected_max REAL

	, cna_adjusted_avg REAL
	, cna_adjusted_min REAL
	, cna_adjusted_max REAL


	, lpn_reported_avg REAL
	, lpn_reported_min REAL
	, lpn_reported_max REAL
	, lpn_rank INT
	, lpn_rank_pct REAL

	, lpn_expected_avg REAL
	, lpn_expected_min REAL
	, lpn_expected_max REAL

	, lpn_adjusted_avg REAL
	, lpn_adjusted_min REAL
	, lpn_adjusted_max REAL


	, rn_reported_avg REAL
	, rn_reported_min REAL
	, rn_reported_max REAL
	, rn_rank INT
	, rn_rank_pct REAL


	, rn_expected_avg REAL
	, rn_expected_min REAL
	, rn_expected_max REAL

	, rn_adjusted_avg REAL
	, rn_adjusted_min REAL
	, rn_adjusted_max REAL


	, licensed_reported_avg REAL
	, licensed_reported_min REAL
	, licensed_reported_max REAL
	, licensed_rank INT
	, licensed_rank_pct REAL



	, therapist_reported_avg REAL
	, therapist_reported_min REAL
	, therapist_reported_max REAL
	, therapist_rank INT
	, therapist_rank_pct REAL



	, total_reported_avg REAL
	, total_reported_min REAL
	, total_reported_max REAL
	, total_rank INT
	, total_rank_pct REAL


	, total_expected_avg REAL
	, total_expected_min REAL
	, total_expected_max REAL

	, total_adjusted_avg REAL
	, total_adjusted_min REAL
	, total_adjusted_max REAL

	, CONSTRAINT pk_summary__staffing_city PRIMARY KEY (state_id, city_id)
);

INSERT INTO summary.staffing_city
SELECT
	p.state_id
	, p.city_id
	
	, CAST(AVG(cna_reported) AS REAL) AS cna_reported_avg
	, CAST(MIN(cna_reported) AS REAL) AS cna_reported_min
	, CAST(MAX(cna_reported) AS REAL) AS cna_reported_max
	, RANK() OVER (PARTITION BY AVG(cna_reported) IS NOT NULL, state_id ORDER BY AVG(cna_reported) DESC) AS cna_rank
	, PERCENT_RANK() OVER (PARTITION BY AVG(cna_reported) IS NOT NULL, state_id ORDER BY AVG(cna_reported) DESC) AS cna_rank_pct
    
	, CAST(AVG(cna_expected) AS REAL) AS cna_expected_avg
	, CAST(MIN(cna_expected) AS REAL) AS cna_expected_min
	, CAST(MAX(cna_expected) AS REAL) AS cna_expected_max

	, CAST(AVG(cna_adjusted) AS REAL) AS cna_adjusted_avg
	, CAST(MIN(cna_adjusted) AS REAL) AS cna_adjusted_min
	, CAST(MAX(cna_adjusted) AS REAL) AS cna_adjusted_max


	, CAST(AVG(lpn_reported) AS REAL) AS lpn_reported_avg
	, CAST(MIN(lpn_reported) AS REAL) AS lpn_reported_min
	, CAST(MAX(lpn_reported) AS REAL) AS lpn_reported_max
	, RANK() OVER (PARTITION BY AVG(lpn_reported) IS NOT NULL, state_id ORDER BY AVG(lpn_reported) DESC) AS lpn_rank
	, PERCENT_RANK() OVER (PARTITION BY AVG(lpn_reported) IS NOT NULL, state_id ORDER BY AVG(lpn_reported) DESC) AS lpn_rank_pct

	, CAST(AVG(lpn_expected) AS REAL) AS lpn_expected_avg
	, CAST(MIN(lpn_expected) AS REAL) AS lpn_expected_min
	, CAST(MAX(lpn_expected) AS REAL) AS lpn_expected_max

	, CAST(AVG(lpn_adjusted) AS REAL) AS lpn_adjusted_avg
	, CAST(MIN(lpn_adjusted) AS REAL) AS lpn_adjusted_min
	, CAST(MAX(lpn_adjusted) AS REAL) AS lpn_adjusted_max


	, CAST(AVG(rn_reported) AS REAL) AS rn_reported_avg
	, CAST(MIN(rn_reported) AS REAL) AS rn_reported_min
	, CAST(MAX(rn_reported) AS REAL) AS rn_reported_max
	, RANK() OVER (PARTITION BY AVG(rn_reported) IS NOT NULL, state_id ORDER BY AVG(rn_reported) DESC) AS rn_rank
	, PERCENT_RANK() OVER (PARTITION BY AVG(rn_reported) IS NOT NULL, state_id ORDER BY AVG(rn_reported) DESC) AS rn_rank_pct

	, CAST(AVG(rn_expected) AS REAL) AS rn_expected_avg
	, CAST(MIN(rn_expected) AS REAL) AS rn_expected_min
	, CAST(MAX(rn_expected) AS REAL) AS rn_expected_max

	, CAST(AVG(rn_adjusted) AS REAL) AS rn_adjusted_avg
	, CAST(MIN(rn_adjusted) AS REAL) AS rn_adjusted_min
	, CAST(MAX(rn_adjusted) AS REAL) AS rn_adjusted_max


	, CAST(AVG(licensed_reported) AS REAL) AS licensed_reported_avg
	, CAST(MIN(licensed_reported) AS REAL) AS licensed_reported_min
	, CAST(MAX(licensed_reported) AS REAL) AS licensed_reported_max
	, RANK() OVER (PARTITION BY AVG(licensed_reported) IS NOT NULL, state_id ORDER BY AVG(licensed_reported) DESC) AS licensed_rank
	, PERCENT_RANK() OVER (PARTITION BY AVG(licensed_reported) IS NOT NULL, state_id ORDER BY AVG(licensed_reported) DESC) AS licensed_rank_pct


	, CAST(AVG(therapist_reported) AS REAL) AS therapist_reported_avg
	, CAST(MIN(therapist_reported) AS REAL) AS therapist_reported_min
	, CAST(MAX(therapist_reported) AS REAL) AS therapist_reported_max
	, RANK() OVER (PARTITION BY AVG(therapist_reported) IS NOT NULL, state_id ORDER BY AVG(therapist_reported) DESC) AS therapist_rank
	, PERCENT_RANK() OVER (PARTITION BY AVG(therapist_reported) IS NOT NULL, state_id ORDER BY AVG(therapist_reported) DESC) AS therapist_rank_pct


	, CAST(AVG(total_reported) AS REAL) AS total_reported_avg
	, CAST(MIN(total_reported) AS REAL) AS total_reported_min
	, CAST(MAX(total_reported) AS REAL) AS total_reported_max
	, RANK() OVER (PARTITION BY AVG(total_reported) IS NOT NULL, state_id ORDER BY AVG(total_reported) DESC) AS total_rank
	, PERCENT_RANK() OVER (PARTITION BY AVG(total_reported) IS NOT NULL, state_id ORDER BY AVG(total_reported) DESC) AS total_rank_pct

	, CAST(AVG(total_expected) AS REAL) AS total_expected_avg
	, CAST(MIN(total_expected) AS REAL) AS total_expected_min
	, CAST(MAX(total_expected) AS REAL) AS total_expected_max

	, CAST(AVG(total_adjusted) AS REAL) AS total_adjusted_avg
	, CAST(MIN(total_adjusted) AS REAL) AS total_adjusted_min
	, CAST(MAX(total_adjusted) AS REAL) AS total_adjusted_max
    
FROM public.staffing s
	INNER JOIN providers p ON p.provnum = s.provnum
GROUP BY state_id, city_id
ORDER BY state_id, city_id;



/*
SELECT * FROM summary.staffing_nation;
SELECT * FROM summary.staffing_state;
SELECT * FROM summary.staffing_city;

*/