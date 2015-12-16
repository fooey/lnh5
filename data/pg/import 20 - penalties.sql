
-- ----------------------------------------
-- 
-- 	POPULATE "penalty" TABLE
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS public.penalty;

CREATE TABLE public.penalty (
	provnum text NOT NULL
	, penalty_date DATE
	, penalty_type TEXT
	, fine_amount INT
	, payment_denial_start_date DATE
	, payment_denial_length_in_days INT
);

INSERT INTO public.penalty
SELECT
	federal_provider_number AS provnum
	, CAST(penalty_date AS DATE) AS penalty_date
	, LEFT(penalty_type, 1) AS penalty_type
	, CAST(CAST(fine_amount AS MONEY) AS DECIMAL) AS fine_amount
	, CAST(payment_denial_start_date AS DATE) AS payment_denial_start_date
	, CAST(payment_denial_length_in_days AS INT) AS payment_denial_length_in_days
	
FROM import.raw_g6vv_u9sr AS r
ORDER BY provnum;


-- ----------------------------------------
-- 
--  	CREATE INDEXES
-- 
-- ----------------------------------------

CREATE INDEX idx_penalty__provnum ON public.penalty (provnum) WITH (fillfactor = 100);



/*
SELECT *
FROM public.penalty;

SELECT DISTINCT penalty_type
FROM import.raw_g6vv_u9sr AS r

*/