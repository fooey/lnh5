/*
SELECT *
FROM import.raw_djen_97ju
LIMIT 100;

SELECT distinct resident_type
FROM import.raw_djen_97ju;
*/



-- ----------------------------------------
-- 
-- 	POPULATE "measures" TABLE
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS public.measures;

CREATE TABLE public.measures (
	provnum TEXT
	, measure_code TEXT
	, processing_date DATE

	, q1_score DECIMAL(9,6)
	, q2_score DECIMAL(9,6)
	, q3_score DECIMAL(9,6)
	, avg_score DECIMAL(9,6)
	
	, q1_footnote INT
	, q2_footnote INT
	, q3_footnote INT
	, avg_footnote INT
	
	, q1_quarter TEXT
	, q2_quarter TEXT
	, q3_quarter TEXT

	, q1_rank INT
	, q2_rank INT
	, q3_rank INT
	, avg_rank INT
	
	, q1_rank_pct REAL
	, q2_rank_pct REAL
	, q3_rank_pct REAL
	, avg_rank_pct REAL	
	
	, CONSTRAINT pk_measures PRIMARY KEY (provnum, measure_code)
);



WITH cte_measures AS (
	SELECT 
		r.federal_provider_number AS provnum
		, measure_code
		, CAST(r.processing_date AS DATE) AS processing_date
		
		, CAST(REPLACE(q1_measure_score, '%', '') AS DECIMAL(9,6)) AS q1_score
		, CAST(REPLACE(q2_measure_score, '%', '') AS DECIMAL(9,6)) AS q2_score
		, CAST(REPLACE(q3_measure_score, '%', '') AS DECIMAL(9,6)) AS q3_score
		, CAST(REPLACE(three_quarter_average, '%', '') AS DECIMAL(9,6)) AS avg_score

		, q1fn.id AS q1_footnote
		, q2fn.id AS q2_footnote
		, q3fn.id AS q3_footnote
		, avgfn.id AS avg_footnote

		, q1_quarter AS q1
		, q2_quarter AS q2
		, q3_quarter AS q3
		
	FROM import.raw_djen_97ju r
		LEFT JOIN dict.measures dm ON r.measure_code = dm.id
		LEFT JOIN dict.footnotes q1fn ON r.footnote_for_q1_measure_score = q1fn.label
		LEFT JOIN dict.footnotes q2fn ON r.footnote_for_q2_measure_score = q2fn.label
		LEFT JOIN dict.footnotes q3fn ON r.footnote_for_q3_measure_score = q3fn.label
		LEFT JOIN dict.footnotes avgfn ON r.footnote_for_three_quarter_average = avgfn.label
)
INSERT INTO public.measures (
	provnum
	, measure_code
	, processing_date

	, q1_score
	, q2_score
	, q3_score
	, avg_score
	
	, q1_footnote
	, q2_footnote
	, q3_footnote
	, avg_footnote
	
	, q1_quarter
	, q2_quarter
	, q3_quarter

	, q1_rank
	, q2_rank
	, q3_rank
	, avg_rank
	
	, q1_rank_pct
	, q2_rank_pct
	, q3_rank_pct
	, avg_rank_pct
)
SELECT 
	provnum
	, measure_code
	, processing_date
	
	, q1_score
	, q2_score
	, q3_score
	, avg_score

	, q1_footnote
	, q2_footnote
	, q3_footnote
	, avg_footnote

	, q1
	, q2
	, q3

	, RANK() OVER (PARTITION BY q1_score IS NOT NULL, measure_code ORDER BY q1_score) AS q1_rank
	, RANK() OVER (PARTITION BY q2_score IS NOT NULL, measure_code ORDER BY q2_score) AS q2_rank
	, RANK() OVER (PARTITION BY q3_score IS NOT NULL, measure_code ORDER BY q3_score) AS q3_rank
	, RANK() OVER (PARTITION BY avg_score IS NOT NULL, measure_code ORDER BY avg_score) AS avg_rank
	
	, PERCENT_RANK() OVER (PARTITION BY q1_score IS NOT NULL, measure_code ORDER BY q1_score) AS q1_rank_pct
	, PERCENT_RANK() OVER (PARTITION BY q2_score IS NOT NULL, measure_code ORDER BY q2_score) AS q2_rank_pct
	, PERCENT_RANK() OVER (PARTITION BY q3_score IS NOT NULL, measure_code ORDER BY q3_score) AS q3_rank_pct
	, PERCENT_RANK() OVER (PARTITION BY avg_score IS NOT NULL, measure_code ORDER BY avg_score) AS avg_rank_pct
	
FROM cte_measures;

CREATE INDEX idx_measures__q1_footnote ON public.measures (q1_footnote) WITH (fillfactor = 100);
CREATE INDEX idx_measures__q2_footnote ON public.measures (q2_footnote) WITH (fillfactor = 100);
CREATE INDEX idx_measures__q3_footnote ON public.measures (q3_footnote) WITH (fillfactor = 100);
CREATE INDEX idx_measures__avg_footnote ON public.measures (avg_footnote) WITH (fillfactor = 100);


/*
SELECT * FROM dict.measures;

SELECT * FROM dict.footnotes;

SELECT *
FROM measures
ORDER BY measure_code, q1_score, q1_rank;



*/