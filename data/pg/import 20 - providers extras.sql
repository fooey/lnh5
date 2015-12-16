

-- ----------------------------------------
-- 
-- 	POPULATE "providers_extras" TABLE
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS public.providers_extras;

CREATE TABLE public.providers_extras (
	provnum text NOT NULL
	
	, initial_date DATE
	, legal_name text
	
	, ownership_type_id INT
	, sprinkler_status_id INT
	
	, num_beds INT
	, num_residents INT
	
	, is_medicare BOOLEAN
	, is_medicaid BOOLEAN
	
	, in_hospital BOOLEAN
	, is_ccrc BOOLEAN
	, is_sff BOOLEAN
	, new_owner BOOLEAN
	
	, has_resident_council BOOLEAN
	, has_family_council BOOLEAN
	
	, CONSTRAINT pk_providers__extras PRIMARY KEY (provnum)
);

INSERT INTO public.providers_extras
SELECT
	federal_provider_number AS provnum
	
	, CAST(date_first_approved_to_provide_medicare_and_medicaid_services AS DATE) AS initial_date
	, NULLIF(lower(legal_business_name), 'legal business name not available') AS legal_name

	, dot.id AS ownership_type_id
	, dss.id AS sprinkler_status_id	

	, CAST(number_of_certified_beds AS INT) AS num_beds
	, CAST(number_of_residents_in_certified_beds AS INT) AS num_residents
	
	, CASE WHEN provider_type IN ('Medicare', 'Medicare and Medicaid') THEN true ELSE false END
	, CASE WHEN provider_type IN ('Medicaid', 'Medicare and Medicaid') THEN true ELSE false END
	
	, CASE provider_resides_in_hospital WHEN 'true' THEN true WHEN 'false' THEN false END
	, CASE continuing_care_retirement_community WHEN 'true' THEN true WHEN 'false' THEN false END
	, CASE special_focus_facility WHEN 'true' THEN true WHEN 'false' THEN false END
	, CASE provider_changed_ownership_in_last_12_months WHEN 'true' THEN true WHEN 'false' THEN false END	
	
	, CASE WHEN with_a_resident_and_family_council IN ('Both', 'Resident') THEN true ELSE false END
	, CASE WHEN with_a_resident_and_family_council IN ('Both', 'Family') THEN true ELSE false END
	
FROM import.raw_4pq5_n9py AS r
	LEFT JOIN dict.ownership_types dot ON r.ownership_type = dot.label
	LEFT JOIN dict.sprinkler_status dss ON r.automatic_sprinkler_systems_in_all_required_areas = dss.label
ORDER BY provnum;


-- ----------------------------------------
-- 
--  	CREATE INDEXES
-- 
-- ----------------------------------------

CREATE INDEX idx_providers_extras__ownership ON providers_extras (ownership_type_id) WITH (fillfactor = 100);
CREATE INDEX idx_providers_extras__sprinklers ON providers_extras (sprinkler_status_id) WITH (fillfactor = 100);



/*



SELECT *
FROM public.providers_extras
WHERE ownership_type_id = 1
LIMIT 100;

SELECT *
FROM import.raw_4pq5_n9py AS raw
LIMIT 100;


SELECT * FROM public.providers_extras;

*/