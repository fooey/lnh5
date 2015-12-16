/*
SELECT *
FROM import.raw_y2hd_n93e
*/

-- ----------------------------------------
-- 
-- 	POPULATE "owner" TABLE
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS public.owner;

CREATE TABLE public.owner (
	provnum text NOT NULL
	, owner_role INT
	, owner_type TEXT
	, owner_name TEXT
	, ownership_percentage TEXT
	, association_date DATE
);

INSERT INTO public.owner
SELECT
	federal_provider_number AS provnum
	, dor.id AS owner_role
	, LEFT(owner_type, 1) AS owner_type
	, owner_name
	, ownership_percentage
	, CAST(split_part(NULLIF(association_date, 'NO DATE PROVIDED'), ' ', 2) AS DATE) AS association_date
	
FROM import.raw_y2hd_n93e AS r
	LEFT JOIN dict.owner_roles AS dor ON r.role_played_by_owner_or_manager_in_facility = dor.label
ORDER BY provnum;


-- ----------------------------------------
-- 
--  	CREATE INDEXES
-- 
-- ----------------------------------------

CREATE INDEX idx_owner__provnum ON public.owner (provnum) WITH (fillfactor = 100);
CREATE INDEX idx_owner__owner_role ON public.owner (owner_role) WITH (fillfactor = 100);


/*

SELECT *
FROM public.owner
LIMIT 100;

SELECT *
FROM import.raw_y2hd_n93e AS r;

SELECT DISTINCT role_played_by_owner_or_manager_in_facility
FROM import.raw_y2hd_n93e AS r;

SELECT association_date
FROM import.raw_y2hd_n93e AS r
WHERE association_date NOT LIKE 'since%';


SELECT * FROM dict.owner_roles;

*/