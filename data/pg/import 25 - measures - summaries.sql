/*
SELECT *
FROM import.raw_djen_97ju
LIMIT 100;

SELECT distinct resident_type
FROM import.raw_djen_97ju;
*/



CREATE SCHEMA IF NOT EXISTS summary;


-- ----------------------------------------
-- 
-- 	POPULATE MEASURE SUMMARIES
-- 
-- ----------------------------------------



-- summary.measures_nation

DROP TABLE IF EXISTS summary.measures_nation;

CREATE TABLE summary.measures_nation (
	measure_code TEXT

	, q1_score_num INT
	, q1_score_avg DECIMAL(9,6)
	, q1_score_min DECIMAL(9,6)
	, q1_score_max DECIMAL(9,6)

	, q2_score_num INT
	, q2_score_avg DECIMAL(9,6)
	, q2_score_min DECIMAL(9,6)
	, q2_score_max DECIMAL(9,6)

	, q3_score_num INT
	, q3_score_avg DECIMAL(9,6)
	, q3_score_min DECIMAL(9,6)
	, q3_score_max DECIMAL(9,6)

	, avg_score_num INT
	, avg_score_avg DECIMAL(9,6)
	, avg_score_min DECIMAL(9,6)
	, avg_score_max DECIMAL(9,6)
	
	, CONSTRAINT pk_measures__nation PRIMARY KEY (measure_code)
);

INSERT INTO summary.measures_nation
SELECT
	measure_code
	
	, COUNT(q1_score) AS q1_score_num
	, CAST(AVG(q1_score) AS DECIMAL(9,3)) AS q1_score_avg
	, CAST(MIN(q1_score) AS DECIMAL(9,3)) AS q1_score_min
	, CAST(MAX(q1_score) AS DECIMAL(9,3)) AS q1_score_max
	
	, COUNT(q2_score) AS q2_score_num
	, CAST(AVG(q2_score) AS DECIMAL(9,3)) AS q2_score_avg
	, CAST(MIN(q2_score) AS DECIMAL(9,3)) AS q2_score_min
	, CAST(MAX(q2_score) AS DECIMAL(9,3)) AS q2_score_max
	
	, COUNT(q3_score) AS q3_score_num
	, CAST(AVG(q3_score) AS DECIMAL(9,3)) AS q3_score_avg
	, CAST(MIN(q3_score) AS DECIMAL(9,3)) AS q3_score_min
	, CAST(MAX(q3_score) AS DECIMAL(9,3)) AS q3_score_max
	
	, COUNT(avg_score) AS avg_score_num
	, CAST(AVG(avg_score) AS DECIMAL(9,3)) AS avg_score_avg
	, CAST(MIN(avg_score) AS DECIMAL(9,3)) AS avg_score_min
	, CAST(MAX(avg_score) AS DECIMAL(9,3)) AS avg_score_max
	
FROM public.measures
GROUP BY measure_code
ORDER BY measure_code;



-- summary.measures_state

DROP TABLE IF EXISTS summary.measures_state;

CREATE TABLE summary.measures_state (
	state_id INT
	, measure_code TEXT

	, q1_score_num INT
	, q1_score_avg DECIMAL(9,6)
	, q1_score_min DECIMAL(9,6)
	, q1_score_max DECIMAL(9,6)

	, q2_score_num INT
	, q2_score_avg DECIMAL(9,6)
	, q2_score_min DECIMAL(9,6)
	, q2_score_max DECIMAL(9,6)

	, q3_score_num INT
	, q3_score_avg DECIMAL(9,6)
	, q3_score_min DECIMAL(9,6)
	, q3_score_max DECIMAL(9,6)

	, avg_score_num INT
	, avg_score_avg DECIMAL(9,6)
	, avg_score_min DECIMAL(9,6)
	, avg_score_max DECIMAL(9,6)

	, q1_rank INT
	, q2_rank INT
	, q3_rank INT
	, avg_rank INT

	, q1_rank_pct REAL
	, q2_rank_pct REAL
	, q3_rank_pct REAL
	, avg_rank_pct REAL
	
	, CONSTRAINT pk_measures__state PRIMARY KEY (state_id, measure_code)
);


WITH cte_measures_state AS (

	SELECT
		state_id
		, measure_code
		
		, COUNT(q1_score) AS q1_score_num
		, CAST(AVG(q1_score) AS DECIMAL(9,3)) AS q1_score_avg
		, CAST(MIN(q1_score) AS DECIMAL(9,3)) AS q1_score_min
		, CAST(MAX(q1_score) AS DECIMAL(9,3)) AS q1_score_max
		
		, COUNT(q2_score) AS q2_score_num
		, CAST(AVG(q2_score) AS DECIMAL(9,3)) AS q2_score_avg
		, CAST(MIN(q2_score) AS DECIMAL(9,3)) AS q2_score_min
		, CAST(MAX(q2_score) AS DECIMAL(9,3)) AS q2_score_max
		
		, COUNT(q3_score) AS q3_score_num
		, CAST(AVG(q3_score) AS DECIMAL(9,3)) AS q3_score_avg
		, CAST(MIN(q3_score) AS DECIMAL(9,3)) AS q3_score_min
		, CAST(MAX(q3_score) AS DECIMAL(9,3)) AS q3_score_max
		
		, COUNT(avg_score) AS avg_score_num
		, CAST(AVG(avg_score) AS DECIMAL(9,3)) AS avg_score_avg
		, CAST(MIN(avg_score) AS DECIMAL(9,3)) AS avg_score_min
		, CAST(MAX(avg_score) AS DECIMAL(9,3)) AS avg_score_max
		
	FROM public.measures m
		INNER JOIN public.providers p ON m.provnum = p.provnum
	GROUP BY 
		measure_code
		, state_id
)

INSERT INTO summary.measures_state
SELECT cte.*

	, RANK() OVER (PARTITION BY q1_score_avg IS NOT NULL, measure_code ORDER BY q1_score_avg) AS q1_rank
	, RANK() OVER (PARTITION BY q2_score_avg IS NOT NULL, measure_code ORDER BY q2_score_avg) AS q2_rank
	, RANK() OVER (PARTITION BY q3_score_avg IS NOT NULL, measure_code ORDER BY q3_score_avg) AS q3_rank
	, RANK() OVER (PARTITION BY avg_score_avg IS NOT NULL, measure_code ORDER BY avg_score_avg) AS avg_rank
	
	, PERCENT_RANK() OVER (PARTITION BY q1_score_avg IS NOT NULL, measure_code ORDER BY q1_score_avg) AS q1_rank_pct
	, PERCENT_RANK() OVER (PARTITION BY q2_score_avg IS NOT NULL, measure_code ORDER BY q2_score_avg) AS q2_rank_pct
	, PERCENT_RANK() OVER (PARTITION BY q3_score_avg IS NOT NULL, measure_code ORDER BY q3_score_avg) AS q3_rank_pct
	, PERCENT_RANK() OVER (PARTITION BY avg_score_avg IS NOT NULL, measure_code ORDER BY avg_score_avg) AS avg_rank_pct
FROM cte_measures_state cte
ORDER BY 
	state_id
	, measure_code;



-- summary.measures_city

DROP TABLE IF EXISTS summary.measures_city;

CREATE TABLE summary.measures_city (
	state_id INT
	, city_id INT
	, measure_code TEXT

	, q1_score_num INT
	, q1_score_avg DECIMAL(9,6)
	, q1_score_min DECIMAL(9,6)
	, q1_score_max DECIMAL(9,6)

	, q2_score_num INT
	, q2_score_avg DECIMAL(9,6)
	, q2_score_min DECIMAL(9,6)
	, q2_score_max DECIMAL(9,6)

	, q3_score_num INT
	, q3_score_avg DECIMAL(9,6)
	, q3_score_min DECIMAL(9,6)
	, q3_score_max DECIMAL(9,6)

	, avg_score_num INT
	, avg_score_avg DECIMAL(9,6)
	, avg_score_min DECIMAL(9,6)
	, avg_score_max DECIMAL(9,6)

	, q1_rank INT
	, q2_rank INT
	, q3_rank INT
	, avg_rank INT

	, q1_rank_pct REAL
	, q2_rank_pct REAL
	, q3_rank_pct REAL
	, avg_rank_pct REAL
	
	, CONSTRAINT pk_measures__city PRIMARY KEY (state_id, city_id, measure_code)
);


WITH cte_measures_city AS (

	SELECT
		state_id
		, city_id
		, measure_code
		
		, COUNT(q1_score) AS q1_score_num
		, CAST(AVG(q1_score) AS DECIMAL(9,3)) AS q1_score_avg
		, CAST(MIN(q1_score) AS DECIMAL(9,3)) AS q1_score_min
		, CAST(MAX(q1_score) AS DECIMAL(9,3)) AS q1_score_max
		
		, COUNT(q2_score) AS q2_score_num
		, CAST(AVG(q2_score) AS DECIMAL(9,3)) AS q2_score_avg
		, CAST(MIN(q2_score) AS DECIMAL(9,3)) AS q2_score_min
		, CAST(MAX(q2_score) AS DECIMAL(9,3)) AS q2_score_max
		
		, COUNT(q3_score) AS q3_score_num
		, CAST(AVG(q3_score) AS DECIMAL(9,3)) AS q3_score_avg
		, CAST(MIN(q3_score) AS DECIMAL(9,3)) AS q3_score_min
		, CAST(MAX(q3_score) AS DECIMAL(9,3)) AS q3_score_max
		
		, COUNT(avg_score) AS avg_score_num
		, CAST(AVG(avg_score) AS DECIMAL(9,3)) AS avg_score_avg
		, CAST(MIN(avg_score) AS DECIMAL(9,3)) AS avg_score_min
		, CAST(MAX(avg_score) AS DECIMAL(9,3)) AS avg_score_max
		
	FROM public.measures m
		INNER JOIN public.providers p ON m.provnum = p.provnum
	GROUP BY 
		measure_code
		, state_id
		, city_id
)

INSERT INTO summary.measures_city
SELECT cte.*

	, RANK() OVER (PARTITION BY q1_score_avg IS NOT NULL, state_id, measure_code ORDER BY q1_score_avg) AS q1_rank
	, RANK() OVER (PARTITION BY q2_score_avg IS NOT NULL, state_id, measure_code ORDER BY q2_score_avg) AS q2_rank
	, RANK() OVER (PARTITION BY q3_score_avg IS NOT NULL, state_id, measure_code ORDER BY q3_score_avg) AS q3_rank
	, RANK() OVER (PARTITION BY avg_score_avg IS NOT NULL, state_id, measure_code ORDER BY avg_score_avg) AS avg_rank
	
	, PERCENT_RANK() OVER (PARTITION BY q1_score_avg IS NOT NULL, state_id, measure_code ORDER BY q1_score_avg) AS q1_rank_pct
	, PERCENT_RANK() OVER (PARTITION BY q2_score_avg IS NOT NULL, state_id, measure_code ORDER BY q2_score_avg) AS q2_rank_pct
	, PERCENT_RANK() OVER (PARTITION BY q3_score_avg IS NOT NULL, state_id, measure_code ORDER BY q3_score_avg) AS q3_rank_pct
	, PERCENT_RANK() OVER (PARTITION BY avg_score_avg IS NOT NULL, state_id, measure_code ORDER BY avg_score_avg) AS avg_rank_pct
FROM cte_measures_city cte
ORDER BY 
	state_id
	, city_id
	, measure_code;




/*
SELECT * FROM summary.measures_nation;


select * from summary.measures_state
where state_id = 37;


select *
from summary.measures_city mc
	inner join geo.cities gc on mc.state_id = gc.state_id and mc.city_id = gc.city_id
	inner join geo.states gs on mc.state_id = gs.state_id
where state_abbr = 'UT'
order by gc.city_name;

*/