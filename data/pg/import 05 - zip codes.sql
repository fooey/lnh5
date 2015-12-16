

-- ----------------------------------------
-- 
-- 	LOAD RAW DATA
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS import.raw_zipcodes;

CREATE TABLE import.raw_zipcodes (
	zipcode TEXT
	, zip_type TEXT
	, city_name TEXT
	, city_type TEXT
	, county_name TEXT
	, county_fips TEXT
	, state_name TEXT
	, state_abbr TEXT
	, state_fips TEXT
	, msa_code TEXT
	, area_code TEXT
	, time_zone TEXT
	, utc TEXT
	, dst TEXT
	, latitude real
	, longitude real
) WITH (OIDS = FALSE);

COPY import.raw_zipcodes
FROM 'D:\inet\projects\lnh5\data\zip\5-digit Commercial.csv'
WITH CSV HEADER;




-- ----------------------------------------
-- 
-- 	INTERMEDIATE TABLE FOR MANIPULATION
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS import.zipcodes;

SELECT
	zipcode
	, zip_type
	, city_name
	, udf_textToSlug(city_name) AS city_slug
	, city_type

	, county_name
	, udf_textToSlug(county_name) AS county_slug

	, state_name
	, state_abbr
	, udf_textToSlug(state_name) AS state_slug

	, ll_to_earth(latitude, longitude) AS geo
    
INTO import.zipcodes
FROM import.raw_zipcodes
WHERE zip_type <> 'M';


/*
	SELECT *
	FROM import.zipcodes
	LIMIT 10
*/





-- ----------------------------------------
-- 
-- 	GENERATE "geo.states"
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS geo.states;

CREATE TABLE geo.states (
	state_id SERIAL
	, state_name TEXT
	, state_abbr TEXT
	, state_slug TEXT
	, state_num INT DEFAULT 0
	, CONSTRAINT pk_geo_states PRIMARY KEY (state_id)
);

INSERT INTO geo.states (
	state_name
	, state_abbr
	, state_slug
)
SELECT
	state_name
	, state_abbr
	, state_slug
FROM import.zipcodes
GROUP BY state_name, state_abbr, state_slug
ORDER BY state_name, state_abbr, state_slug;



-- ----------------------------------------
--  	CREATE INDEXES ON "geo.states"
-- ----------------------------------------

-- CREATE UNIQUE INDEX cx_geo_states_id ON geo.states (state_id) WITH (fillfactor = 100);
-- CLUSTER geo.states USING cx_geo_states_id;

CREATE INDEX idx_geo__states__slug ON geo.states (state_slug) WITH (fillfactor = 100);

CREATE INDEX idx_geo__states__abbr ON geo.states (state_abbr) WITH (fillfactor = 100);
CREATE INDEX idx_geo__states__abbr_lower ON geo.states (lower(state_abbr)) WITH (fillfactor = 100);

CREATE INDEX idx_geo__states__state ON geo.states (state_name) WITH (fillfactor = 100);
CREATE INDEX idx_geo__states__state_lower ON geo.states (lower(state_name)) WITH (fillfactor = 100);

/*
SELECT *
FROM geo.states
ORDER BY state_name
*/




-- ----------------------------------------
-- 
-- 	GENERATE "geo.counties"
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS geo.counties;

CREATE TABLE geo.counties (
	county_id SERIAL
	, state_id INT
	, county_name TEXT
	, county_slug TEXT
	, county_num INT DEFAULT 0
	, CONSTRAINT pk_geo_counties PRIMARY KEY (county_id)
);

INSERT INTO geo.counties (
	state_id
	, county_name
	, county_slug
)
SELECT DISTINCT
    state_id
    , county_name
    , county_slug
FROM import.zipcodes z
	INNER JOIN geo.states gs on z.state_slug = gs.state_slug;



-- ----------------------------------------
--  	CREATE INDEXES ON "geo.counties"
-- ----------------------------------------

-- CREATE UNIQUE INDEX cx_geo_counties_id ON geo.counties (county_id) WITH (fillfactor = 100);
-- CLUSTER geo.counties USING cx_geo_counties_id;

CREATE INDEX idx_geo__counties__slug ON geo.counties (state_id, county_slug) WITH (fillfactor = 100);

CREATE INDEX idx_geo__counties__name ON geo.counties (state_id, county_name) WITH (fillfactor = 100);
CREATE INDEX idx_geo__counties__name_lower ON geo.counties (state_id, lower(county_name)) WITH (fillfactor = 100);

/*
SELECT *
FROM geo.counties
*/





-- ----------------------------------------
-- 
-- 	GENERATE "geo.cities"
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS geo.cities;

CREATE TABLE geo.cities (
	city_id SERIAL
	, state_id INT
	, city_type TEXT
	, city_name TEXT
	, city_slug TEXT
	, city_num INT DEFAULT 0
	, CONSTRAINT pk_geo__cities PRIMARY KEY (city_id)
);

INSERT INTO geo.cities (
	state_id
	, city_type
	, city_name
	, city_slug
)
SELECT DISTINCT
	state_id
	, city_type
	, city_name
	, city_slug
FROM import.zipcodes z
	INNER JOIN geo.states gs on z.state_slug = gs.state_slug;



-- ----------------------------------------
--  	CREATE INDEXES ON "geo.cities"
-- ----------------------------------------

-- CREATE UNIQUE INDEX cx_geo_cities_id ON geo.cities (city_id) WITH (fillfactor = 100);
-- CLUSTER geo.cities USING cx_geo_cities_id;

CREATE INDEX idx_geo__cities__slug ON geo.cities (state_id, city_slug, city_type) WITH (fillfactor = 100);

CREATE INDEX idx_geo__cities__name ON geo.cities (state_id, city_name, city_type) WITH (fillfactor = 100);
CREATE INDEX idx_geo__cities__name_lower ON geo.cities (state_id, lower(city_name), city_type) WITH (fillfactor = 100);

/*
SELECT *
FROM geo.cities
WHERE state_id = 52
	AND city_slug = 'st-george'
*/





-- ----------------------------------------
-- 
-- 	GENERATE "geo.county_cities"
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS geo.county_cities;

CREATE TABLE geo.county_cities (
	city_id SERIAL
	, state_id INT
	, county_id INT
	, city_type TEXT
	, city_name TEXT
	, city_slug TEXT
	, city_num INT DEFAULT 0
	, CONSTRAINT pk_geo__county_cities PRIMARY KEY (city_id)
);

INSERT INTO geo.county_cities (
	state_id
	, county_id
	, city_type
	, city_name
	, city_slug
)
SELECT DISTINCT
	gs.state_id
	, county_id
	, city_type
	, city_name
	, city_slug
FROM import.zipcodes z
	INNER JOIN geo.states gs ON z.state_slug = gs.state_slug
	INNER JOIN geo.counties gco ON (
		gs.state_id = gco.state_id
		AND z.county_slug =  gco.county_slug
	);



-- ----------------------------------------
--  	CREATE INDEXES ON "geo.county_cities"
-- ----------------------------------------

-- CREATE UNIQUE INDEX cx_geo_county_cities_id ON geo.county_cities (city_id) WITH (fillfactor = 100);
-- CLUSTER geo.county_cities USING cx_geo_county_cities_id;

CREATE INDEX idx_geo__county__cities_slug ON geo.county_cities (state_id, city_slug, city_type) WITH (fillfactor = 100);

CREATE INDEX idx_geo__county__cities_name ON geo.county_cities (state_id, city_name, city_type) WITH (fillfactor = 100);
CREATE INDEX idx_geo__county__cities_name_lower ON geo.county_cities (state_id, lower(city_name), city_type) WITH (fillfactor = 100);






-- ----------------------------------------
-- 
-- 	GENERATE "geo.zipcodes"
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS geo.zipcodes;

CREATE TABLE geo.zipcodes (
	zip_id SERIAL
	, zipcode TEXT
	, zip_type TEXT
	, state_id INT
	, county_id INT
	, city_id INT
	, city_type TEXT
	, geo CUBE
	, zipcode_num INT DEFAULT 0
	, CONSTRAINT pk_geo__zipcodes PRIMARY KEY (zip_id)
);

INSERT INTO geo.zipcodes (
	zipcode
	, zip_type
	, state_id
	, county_id
	, city_id
	, city_type
	, geo
)
SELECT
	z.zipcode
	, z.zip_type
	, gs.state_id
	, gco.county_id
	, gci.city_id
	, gci.city_type
	, z.geo
FROM import.zipcodes z
	INNER JOIN geo.states gs ON z.state_slug = gs.state_slug
	INNER JOIN geo.counties gco ON (
		gs.state_id = gco.state_id
		AND z.county_slug =  gco.county_slug
	)
	INNER JOIN geo.cities gci ON (
		gs.state_id = gci.state_id
		AND z.city_slug =  gci.city_slug
	)
ORDER BY z.zipcode;



-- ----------------------------------------
--  	CREATE INDEXES ON "geo.zipcodes"
-- ----------------------------------------

CREATE INDEX idx_geo__zipcodes__geo ON geo.zipcodes USING gist(geo) WITH (fillfactor = 100);
CREATE INDEX idx_geo__zipcodes__zipcode ON geo.zipcodes (zipcode) WITH (fillfactor = 100);
CREATE INDEX idx_geo__zipcodes__state ON geo.zipcodes (state_id) WITH (fillfactor = 100);
CREATE INDEX idx_geo__zipcodes__county ON geo.zipcodes (state_id, county_id) WITH (fillfactor = 100);
CREATE INDEX idx_geo__zipcodes__city ON geo.zipcodes (state_id, city_id, city_type) WITH (fillfactor = 100);






-- ----------------------------------------
-- 
-- 	CLEANUP
-- 
-- ----------------------------------------


DROP TABLE IF EXISTS import.raw_zipcodes;
DROP TABLE IF EXISTS import.zipcodes;




/*

SELECT *
FROM geo.zipcodes z
	inner join geo.states s on z.state_id = s.state_id
	inner join geo.cities ci on z.state_id = ci.state_id and z.city_id = ci.city_id
where s.state_abbr = 'UT'
	and ci.city_name = 'Saint George'
	

*/