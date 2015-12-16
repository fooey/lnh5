

-- ----------------------------------------
-- 
-- 	POPULATE "staffing" TABLE
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS public.staffing;

CREATE TABLE public.staffing (
	provnum text NOT NULL

	, cna_reported DECIMAL(7,5)
	, cna_expected DECIMAL(7,5)
	, cna_adjusted DECIMAL(7,5)
	, cna_rank INT
	, cna_rank_pct REAL
	
	, lpn_reported DECIMAL(7,5)
	, lpn_expected DECIMAL(7,5)
	, lpn_adjusted DECIMAL(7,5)
	, lpn_rank INT
	, lpn_rank_pct REAL
	
	, rn_reported DECIMAL(7,5)
	, rn_expected DECIMAL(7,5)
	, rn_adjusted DECIMAL(7,5)
	, rn_rank INT
	, rn_rank_pct REAL
	
	, licensed_reported DECIMAL(7,5)
	, license_rank INT
	, license_rank_pct REAL
	
	, therapist_reported DECIMAL(7,5)
	, therapist_rank INT
	, therapist_rank_pct REAL
	
	, total_reported DECIMAL(7,5)
	, total_expected DECIMAL(7,5)
	, total_adjusted DECIMAL(7,5)
	, total_rank INT
	, total_rank_pct REAL

	, staffing_footnote INT
	, therapist_footnote INT
	
	, CONSTRAINT pk_staffing PRIMARY KEY (provnum)
);

INSERT INTO public.staffing
SELECT
	p.provnum

	, cna_reported
	, cna_expected
	, cna_adjusted
	, RANK() OVER (PARTITION BY cna_reported IS NOT NULL, state_id ORDER BY cna_reported DESC) AS cna_rank
	, PERCENT_RANK() OVER (PARTITION BY cna_reported IS NOT NULL, state_id ORDER BY cna_reported DESC) AS cna_rank_pct
	
	, lpn_reported
	, lpn_expected
	, lpn_adjusted
	, RANK() OVER (PARTITION BY lpn_reported IS NOT NULL, state_id ORDER BY cna_reported DESC) AS lpn_rank
	, PERCENT_RANK() OVER (PARTITION BY lpn_reported IS NOT NULL, state_id ORDER BY cna_reported DESC) AS lpn_rank_pct
	
	, rn_reported
	, rn_expected
	, rn_adjusted
	, RANK() OVER (PARTITION BY rn_reported IS NOT NULL, state_id ORDER BY rn_reported DESC) AS rn_rank
	, PERCENT_RANK() OVER (PARTITION BY rn_reported IS NOT NULL, state_id ORDER BY rn_reported DESC) AS rn_rank_pct
	
	, licensed_reported
	, RANK() OVER (PARTITION BY licensed_reported IS NOT NULL, state_id ORDER BY licensed_reported DESC) AS licensed_rank
	, PERCENT_RANK() OVER (PARTITION BY licensed_reported IS NOT NULL, state_id ORDER BY licensed_reported DESC) AS licensed_rank_pct
	
	, therapist_reported
	, RANK() OVER (PARTITION BY therapist_reported IS NOT NULL, state_id ORDER BY therapist_reported DESC) AS therapist_rank
	, PERCENT_RANK() OVER (PARTITION BY therapist_reported IS NOT NULL, state_id ORDER BY therapist_reported DESC) AS therapist_rank_pct
	
	, total_reported
	, total_expected
	, total_adjusted
	, RANK() OVER (PARTITION BY total_reported IS NOT NULL, state_id ORDER BY total_reported DESC) AS total_rank
	, PERCENT_RANK() OVER (PARTITION BY total_reported IS NOT NULL, state_id ORDER BY total_reported DESC) AS total_rank_pct

	, staffing_footnote
	, therapist_footnote
FROM (
	SELECT
		federal_provider_number AS provnum

		, CAST(reported_cna_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS cna_reported
		, CAST(expected_cna_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS cna_expected
		, CAST(adjusted_cna_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS cna_adjusted

		, CAST(reported_lpn_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS lpn_reported
		, CAST(expected_lpn_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS lpn_expected
		, CAST(adjusted_lpn_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS lpn_adjusted

		, CAST(reported_rn_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS rn_reported
		, CAST(expected_rn_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS rn_expected
		, CAST(adjusted_rn_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS rn_adjusted

		, CAST(reported_licensed_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS licensed_reported
		, CAST(reported_physical_therapist_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS therapist_reported

		, CAST(reported_total_nurse_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS total_reported
		, CAST(expected_total_nurse_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS total_expected
		, CAST(adjusted_total_nurse_staffing_hours_per_resident_per_day AS DECIMAL(7,5)) AS total_adjusted

		, df1.id AS staffing_footnote
		, df2.id AS therapist_footnote
		
	FROM import.raw_4pq5_n9py AS r
		LEFT JOIN dict.footnotes df1 ON  df1.label = r.reported_staffing_footnote
		LEFT JOIN dict.footnotes df2 ON  df2.label = r.physical_therapist_staffing_footnote
) converted_hours
	INNER JOIN providers p ON p.provnum = converted_hours.provnum
ORDER BY provnum;



-- ----------------------------------------
-- 
--  	CREATE INDEXES
-- 
-- ----------------------------------------

CREATE INDEX idx_staffing__staffing_footnote ON public.staffing (staffing_footnote) WITH (fillfactor = 100);
CREATE INDEX idx_staffing__therapist_footnote ON public.staffing (therapist_footnote) WITH (fillfactor = 100);



/*

SELECT *
FROM public.staffing
WHERE total_reported IS NOT NULL
ORDER BY total_rank
LIMIT 100;

*/