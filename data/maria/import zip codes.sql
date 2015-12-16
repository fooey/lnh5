
-- ----------------------------------------
-- 
-- 	LOAD RAW DATA
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS raw_zipcodes;

CREATE TABLE raw_zipcodes (
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
	, latitude TEXT
	, longitude TEXT
) ENGINE=Aria;


LOAD DATA LOCAL INFILE 'D:\\inet\\wr\\lnh5\\data\\zip\\5-digit Commercial.csv'
INTO TABLE raw_zipcodes
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

DELETE FROM raw_zipcodes WHERE zip_type = 'M';
UPDATE raw_zipcodes SET latitude = TRIM(latitude);
UPDATE raw_zipcodes SET longitude = TRIM(longitude);




-- ----------------------------------------
-- 
-- 	INTERMEDIATE TABLE FOR MANIPULATION
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS temp_zipcodes;

CREATE TABLE temp_zipcodes (
	zipcode char(5) NOT NULL
	, zip_type char(1) NOT NULL
	
	, city_name varchar(50) NOT NULL
	, city_slug varchar(50) NOT NULL
	, city_type char(1) NOT NULL
	
	, county_name varchar(50) NOT NULL
	, county_slug varchar(50) NOT NULL
	
	, state_name varchar(50) NOT NULL
	, state_abbr char(2) NOT NULL
	, state_slug varchar(50) NOT NULL
	
	, latitude float NOT NULL
	, longitude float NOT NULL
	, geo GEOMETRY NOT NULL
) ENGINE=Aria;


INSERT INTO temp_zipcodes
SELECT
	zipcode
	, zip_type
	, city_name
	, LOWER(regexp_replace(city_name, '[^a-z0-9]{1,}', ' ')) AS city_slug
	, city_type

	, county_name
	, LOWER(regexp_replace(county_name, '[^a-z0-9]{1,}', ' ')) AS county_slug

	, state_name
	, state_abbr
	, LOWER(regexp_replace(state_name, '[^a-z0-9]{1,}', ' ')) AS state_slug
	
	, CAST(latitude AS double) AS latitude
	, CAST(longitude AS double) AS longitude
	, ST_PointFromWKB(Point(latitude, longitude)) AS geo

FROM raw_zipcodes;


UPDATE temp_zipcodes
SET city_slug = regexp_replace(trim(city_slug), ' {1,}', '-')
	, county_slug = regexp_replace(trim(county_slug), ' {1,}', '-')
	, state_slug = regexp_replace(trim(state_slug), ' {1,}', '-');
	


CREATE SPATIAL INDEX sdx_geo ON temp_zipcodes (geo);


-- CREATE INDEX idx_geo_tmpzipcodes_geo ON temp_zipcodes USING gist(geo);

/*
	SELECT *
	FROM temp_zipcodes
	LIMIT 10
*/





-- ----------------------------------------
-- 
-- 	GENERATE "geo_states"
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS geo_states;

CREATE TABLE geo_states (
	state_id SERIAL
	, state_name TEXT
	, state_abbr TEXT
	, state_slug TEXT
	, CONSTRAINT pk_geo_states PRIMARY KEY (state_id)
);

INSERT INTO geo_states (
	state_name
	, state_abbr
	, state_slug
)
SELECT
	state_name
	, state_abbr
	, state_slug
FROM temp_zipcodes
WHERE city_type = 'D'
GROUP BY state_name, state_abbr, state_slug
ORDER BY state_name, state_abbr, state_slug;



-- ----------------------------------------
--  	CREATE INDEXES ON "geo_states"
-- ----------------------------------------

-- CREATE UNIQUE INDEX cx_geo_states_id ON geo_states (state_id) WITH (fillfactor = 100);
-- CLUSTER geo_states USING cx_geo_states_id;

CREATE INDEX idx_geo_states_slug ON geo_states (state_slug) WITH (fillfactor = 100);

CREATE INDEX idx_geo_states_abbr ON geo_states (state_abbr) WITH (fillfactor = 100);
CREATE INDEX idx_geo_states_abbr_lower ON geo_states (lower(state_abbr)) WITH (fillfactor = 100);

CREATE INDEX idx_geo_states_state ON geo_states (state_name) WITH (fillfactor = 100);
CREATE INDEX idx_geo_states_state_lower ON geo_states (lower(state_name)) WITH (fillfactor = 100);

/*
SELECT *
FROM geo_states
ORDER BY state_name
*/




-- ----------------------------------------
-- 
-- 	GENERATE "geo_counties"
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS geo_counties;

CREATE TABLE geo_counties (
	county_id SERIAL
	, state_id INT
	, county_name TEXT
	, county_slug TEXT
	, CONSTRAINT pk_geo_counties PRIMARY KEY (county_id)
);

INSERT INTO geo_counties (
	state_id
	, county_name
	, county_slug
)
SELECT DISTINCT
    state_id
    , county_name
    , county_slug
FROM temp_zipcodes z
	INNER JOIN geo_states gs on z.state_slug = gs.state_slug;



-- ----------------------------------------
--  	CREATE INDEXES ON "geo_counties"
-- ----------------------------------------

-- CREATE UNIQUE INDEX cx_geo_counties_id ON geo_counties (county_id) WITH (fillfactor = 100);
-- CLUSTER geo_counties USING cx_geo_counties_id;

CREATE INDEX idx_geo_counties_slug ON geo_counties (state_id, county_slug) WITH (fillfactor = 100);

CREATE INDEX idx_geo_counties_name ON geo_counties (state_id, county_name) WITH (fillfactor = 100);
CREATE INDEX idx_geo_counties_name_lower ON geo_counties (state_id, lower(county_name)) WITH (fillfactor = 100);

/*
SELECT *
FROM geo_counties
*/





-- ----------------------------------------
-- 
-- 	GENERATE "geo_cities"
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS geo_cities;

CREATE TABLE geo_cities (
	city_id SERIAL
	, state_id INT
	, city_type TEXT
	, city_name TEXT
	, city_slug TEXT
	, CONSTRAINT pk_geo_cities PRIMARY KEY (city_id)
);

INSERT INTO geo_cities (
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
FROM temp_zipcodes z
	INNER JOIN geo_states gs on z.state_slug = gs.state_slug;



-- ----------------------------------------
--  	CREATE INDEXES ON "geo_cities"
-- ----------------------------------------

-- CREATE UNIQUE INDEX cx_geo_cities_id ON geo_cities (city_id) WITH (fillfactor = 100);
-- CLUSTER geo_cities USING cx_geo_cities_id;

CREATE INDEX idx_geo_cities_slug ON geo_cities (state_id, city_slug, city_type) WITH (fillfactor = 100);

CREATE INDEX idx_geo_cities_name ON geo_cities (state_id, city_name, city_type) WITH (fillfactor = 100);
CREATE INDEX idx_geo_cities_name_lower ON geo_cities (state_id, lower(city_name), city_type) WITH (fillfactor = 100);

/*
SELECT *
FROM geo_cities
WHERE state_id = 52
	AND city_slug = 'st-george'
*/





-- ----------------------------------------
-- 
-- 	GENERATE "geo_county_cities"
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS geo_county_cities;

CREATE TABLE geo_county_cities (
	city_id SERIAL
	, state_id INT
	, county_id INT
	, city_type TEXT
	, city_name TEXT
	, city_slug TEXT
	, CONSTRAINT pk_geo_county_cities PRIMARY KEY (city_id)
);

INSERT INTO geo_county_cities (
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
FROM temp_zipcodes z
	INNER JOIN geo_states gs ON z.state_slug = gs.state_slug
	INNER JOIN geo_counties gco ON (
		gs.state_id = gco.state_id
		AND z.county_slug =  gco.county_slug
	);



-- ----------------------------------------
--  	CREATE INDEXES ON "geo_county_cities"
-- ----------------------------------------

-- CREATE UNIQUE INDEX cx_geo_county_cities_id ON geo_county_cities (city_id) WITH (fillfactor = 100);
-- CLUSTER geo_county_cities USING cx_geo_county_cities_id;

CREATE INDEX idx_geo_county_cities_slug ON geo_county_cities (state_id, city_slug, city_type) WITH (fillfactor = 100);

CREATE INDEX idx_geo_county_cities_name ON geo_county_cities (state_id, city_name, city_type) WITH (fillfactor = 100);
CREATE INDEX idx_geo_county_cities_name_lower ON geo_county_cities (state_id, lower(city_name), city_type) WITH (fillfactor = 100);






-- ----------------------------------------
-- 
-- 	GENERATE "geo_zipcodes"
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS geo_zipcodes;

CREATE TABLE geo_zipcodes (
	zip_id SERIAL
	, zipcode TEXT
	, zip_type TEXT
	, state_id INT
	, county_id INT
	, city_id INT
	, city_type TEXT
	, geo CUBE
	, CONSTRAINT pk_geo_zipcodes PRIMARY KEY (zip_id)
);

INSERT INTO geo_zipcodes (
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
FROM temp_zipcodes z
	INNER JOIN geo_states gs ON z.state_slug = gs.state_slug
	INNER JOIN geo_counties gco ON (
		gs.state_id = gco.state_id
		AND z.county_slug =  gco.county_slug
	)
	INNER JOIN geo_cities gci ON (
		gs.state_id = gci.state_id
		AND z.city_slug =  gci.city_slug
	)
ORDER BY z.zipcode;



-- ----------------------------------------
--  	CREATE INDEXES ON "geo_zipcodes"
-- ----------------------------------------

CREATE INDEX idx_geo_zipcodes_geo ON geo_zipcodes USING gist(geo) WITH (fillfactor = 100);
CREATE INDEX idx_geo_zipcodes_zipcode ON geo_zipcodes (zipcode) WITH (fillfactor = 100);
CREATE INDEX idx_geo_zipcodes_state ON geo_zipcodes (state_id) WITH (fillfactor = 100);
CREATE INDEX idx_geo_zipcodes_county ON geo_zipcodes (state_id, county_id) WITH (fillfactor = 100);
CREATE INDEX idx_geo_zipcodes_city ON geo_zipcodes (state_id, city_id, city_type) WITH (fillfactor = 100);



/*

SELECT *
FROM geo_zipcodes z
	inner join geo_states s on z.state_id = s.state_id
	inner join geo_cities ci on z.state_id = ci.state_id and z.city_id = ci.city_id
where s.state_abbr = 'UT'
	and ci.city_name = 'Saint George'
	

*/