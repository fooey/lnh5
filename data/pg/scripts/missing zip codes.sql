-- select *
-- from providers
-- where zipcode = '84790'
-- 
-- 
-- select *
-- from providers
-- where slug = 'seasons-health-and-rehabilitation'
-- 
-- 
-- select *
-- from providers
-- where city_id is null
-- 
-- select *
-- from providers
-- where county_id is null
-- 
-- select *
-- from providers
-- where state_id is null

-- SELECT
-- 	z.state_id
-- 	, z.city_id
-- 	, z.county_id
-- FROM providers p
-- 	inner join geo.zipcodes AS z
-- 		on p.zipcode = z.zipcode;

-- with nogeo as (
-- 
-- 	SELECT p.provnum
-- 	FROM import.providers p
-- 		LEFT JOIN import.zipcodes z ON p.zipcode = z.zipcode
-- 	WHERE z.zipcode IS NULL
-- )
-- 
-- select *
-- from nogeo n
-- 	left join geo.states s on n.state_abbr = s.state_abbr
-- 	left join geo.cities c
-- 		on s.state_id = c.state_id
-- 		and lower(c.city_name) = n.city
-- 		and c.city_type = 'D'
-- 	left join geo.zipcodes z
-- 		on c.city_id = z.city_id
-- 		and z.city_type = 'D'


/*
UPDATE import.providers AS p
SET 
	state_id = NULL
	, city_id = NULL
	, county_id = NULL
*/


-- LINK TO "geo" TABLES VIA "zipcode"
UPDATE import.providers AS p
SET
	state_id = z.state_id
	, city_id = z.city_id
	, county_id = z.county_id
FROM geo.zipcodes AS z
WHERE p.zipcode = z.zipcode;


-- LINK "state_id" FOR INVALID "zipcode"
UPDATE import.providers AS p
SET state_id = s.state_id
FROM geo.states AS s
WHERE p.state_id IS NULL
	AND p.state_abbr = s.state_abbr;


-- LINK "city_id" FOR INVALID "zipcode"
UPDATE import.providers AS p
SET city_id = c.city_id
FROM geo.cities c
WHERE p.city_id IS NULL
	AND p.city = lower(c.city_name)
	AND c.state_id = p.state_id
	AND c.city_type = 'D';
	
-- LINK "city_id" FOR INVALID "zipcode" AND "city" ("wellesley fms")
UPDATE import.providers AS p
SET city_id = c.city_id
FROM geo.cities c
WHERE p.city_id IS NULL
	AND p.city = lower(c.city_name)
	AND c.state_id = p.state_id;



SELECT p.*
FROM import.providers p
WHERE p.state_id IS NULL OR p.city_id IS NULL;

SELECT p.provnum, p.city_id, p.city, c.city_id, c.city_name
FROM import.providers p
	LEFT JOIN geo.cities c
		ON p.city = lower(c.city_name)
		AND c.state_id = p.state_id
		AND c.city_type = 'D'
WHERE p.city_id IS NULL
GROUP BY ;










































