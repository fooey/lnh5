

-- ----------------------------------------
-- 
--  	LOAD RAW DATA
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS import.providers;

CREATE TABLE import.providers (
	provnum text NOT NULL
	, slug text
	, name text NOT NULL
	, phone_number text
	, zipcode text NOT NULL
	, street text NOT NULL
	, city text NOT NULL
	, city_id int
	, state_abbr text NOT NULL
	, state_id int
	, county text NOT NULL
	, county_id int
	, location text
	, latitude double precision
	, longitude double precision
	, geo cube
);

INSERT INTO import.providers
SELECT
	federal_provider_number AS provnum
	, public.udf_textToSlug(Provider_Name) as slug
	, lower(Provider_Name) AS name
	
	, Provider_Phone_Number AS phone_number
	
	, Provider_Zip_Code AS zipcode
	, lower(Provider_Address) AS street
	
	, lower(Provider_City) AS city
	, CAST(NULL AS int) as city_id
	
	, Provider_State AS state_abbr
	, CAST(NULL AS int) as state_id
	
	, lower(Provider_County_Name) AS county
	, CAST(NULL AS int) as county_id
	
	, Location
	, CAST(NULL AS double precision) as latitude
	, CAST(NULL AS double precision) as longitude
	, CAST(NULL AS cube) as geo
	
FROM import.raw_4pq5_n9py AS raw
ORDER BY provnum;




-- ----------------------------------------
-- 
--  	MANIPULATE DATA
-- 
-- ----------------------------------------

-- generate "geo", "lat" and "long" from "location"
UPDATE import.providers SET location = split_part(split_part(location, '(', 2), ')', 1);
UPDATE import.providers SET latitude = cast(trim(split_part(location, ',', 1)) as double precision) WHERE location LIKE '%,%';;
UPDATE import.providers SET longitude = cast(trim(split_part(location, ',', 2)) as double precision) WHERE location LIKE '%,%';;
UPDATE import.providers SET geo = ll_to_earth(latitude, longitude) WHERE location LIKE '%,%';




-- ----------------------------------------
-- 
--  	LINK TO "geo" TABLES
-- 
-- ----------------------------------------

-- LINK TO "geo" TABLES VIA "zipcode"
UPDATE import.providers AS p
SET
	state_id = z.state_id
	, city_id = z.city_id
	, county_id = z.county_id
FROM geo.zipcodes AS z
WHERE p.zipcode = z.zipcode
	AND z.city_type = 'D';

-- LINK "state_id" FOR INVALID "zipcode"
UPDATE import.providers AS p
SET state_id = s.state_id
FROM geo.states AS s
WHERE p.state_id IS NULL
	AND p.state_abbr = s.state_abbr;
	
-- LINK "county_id" FOR INVALID "zipcode"
UPDATE import.providers AS p
SET county_id = c.county_id
FROM geo.counties c
WHERE p.county_id IS NULL
	AND p.county = lower(c.county_name)
	AND c.state_id = p.state_id;


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





-- ----------------------------------------
-- 
--  	PUSH TO "providers"
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS providers;

CREATE TABLE providers (
	provnum text NOT NULL
	, slug text
	, name text NOT NULL
	, phone_number text
	, zipcode text NOT NULL
	, street text NOT NULL
	, city_id int
	, state_id int
	, county_id int
	, geo cube
	, CONSTRAINT pk_providers PRIMARY KEY (provnum)
);

INSERT INTO providers
SELECT 
	provnum
	, slug
	, name
	, phone_number
	, zipcode
	, street
	, city_id
	, state_id
	, county_id
	, geo
FROM import.providers
ORDER BY provnum;





-- ----------------------------------------
-- 
--  	CREATE INDEXES
-- 
-- ----------------------------------------

-- CREATE UNIQUE INDEX cx_providers__provnum ON providers (provnum) WITH (fillfactor = 100);
-- CLUSTER providers USING cx_providers__provnum;

CREATE INDEX idx_providers__slug ON providers (slug) WITH (fillfactor = 100);
CREATE INDEX idx_providers__state ON providers (state_id) WITH (fillfactor = 100);
CREATE INDEX idx_providers__state_city ON providers (state_id, city_id) WITH (fillfactor = 100);
CREATE INDEX idx_providers__zipcode ON providers (zipcode) WITH (fillfactor = 100);

CREATE INDEX idx_providers__geo ON providers USING gist(geo);








-- ----------------------------------------
-- 
--  	UPDATE geo TABLES WITH number of homes
-- 
-- ----------------------------------------

UPDATE geo.states s
SET state_num = (
	SELECT COUNT(*) AS state_num 
	FROM providers p
	WHERE s.state_id = p.state_id
);

UPDATE geo.counties c
SET county_num = (
	SELECT COUNT(*) AS county_num 
	FROM providers p
	WHERE c.county_id = p.county_id
);

UPDATE geo.cities c
SET city_num = (
	SELECT COUNT(*) AS city_num 
	FROM providers p
	WHERE c.city_id = p.city_id
);

UPDATE geo.zipcodes z
SET zipcode_num = (
	SELECT COUNT(*) AS zipcode_num 
	FROM providers p
	WHERE z.zipcode = p.zipcode
);






-- VACUUM FULL providers;

/*

SELECT COUNT(*) FROM providers;
SELECT COUNT(*) FROM providers WHERE state = 'UT';
SELECT * FROM providers WHERE zipcode = ANY('{84790,84770,84078,06611}'::text[]);

SELECT *
FROM providers p
	INNER JOIN geo.states gs ON gs.state_id = p.state_id
	INNER JOIN geo.cities gc
		ON gc.city_id = p.city_id
		AND gc.state_id = p.state_id
WHERE gs.state_abbr = 'MA'
	AND gc.city_slug = 'wellesley-fms'::text

SELECT *
FROM providers 
WHERE slug SIMILAR TO '%[^a-z0-9 -]%'

SELECT *
FROM providers 
WHERE slug LIKE '%-%'

SELECT *
FROM providers 
WHERE slug SIMILAR TO '[0-9A-F]{6}-%'

*/