
-- ----------------------------------------
-- 
-- 	POPULATE provider SUMMARIES
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS summary.provider_nation;

CREATE TABLE summary.provider_nation (
	num INT
	
	, num_beds_avg REAL
	, num_beds_min REAL
	, num_beds_max REAL
	
	, num_residents_avg REAL
	, num_residents_min REAL
	, num_residents_max REAL

	, num_is_medicare INT
	, num_is_medicaid INT
	, num_in_hospital INT
	, num_is_ccrc INT
	, num_is_sff INT
	, num_new_owner INT
	, num_has_resident_council INT
	, num_has_family_council INT
);

INSERT INTO summary.provider_nation
SELECT
	COUNT(*) AS num
	
	, CAST(AVG(num_beds) AS REAL) AS num_beds_avg
	, CAST(MIN(num_beds) AS REAL) AS num_beds_min
	, CAST(MAX(num_beds) AS REAL) AS num_beds_max
	
	, CAST(AVG(num_residents) AS REAL) AS num_residents_avg
	, CAST(MIN(num_residents) AS REAL) AS num_residents_min
	, CAST(MAX(num_residents) AS REAL) AS num_residents_max
	
	, SUM(CASE is_medicare WHEN true THEN 1 ELSE 0 END) AS num_is_medicare
	, SUM(CASE is_medicaid WHEN true THEN 1 ELSE 0 END) AS num_is_medicaid
	, SUM(CASE in_hospital WHEN true THEN 1 ELSE 0 END) AS num_in_hospital
	, SUM(CASE is_ccrc WHEN true THEN 1 ELSE 0 END) AS num_is_ccrc
	, SUM(CASE is_sff WHEN true THEN 1 ELSE 0 END) AS num_is_sff
	, SUM(CASE new_owner WHEN true THEN 1 ELSE 0 END) AS num_new_owner
	, SUM(CASE has_resident_council WHEN true THEN 1 ELSE 0 END) AS num_has_resident_council
	, SUM(CASE has_family_council WHEN true THEN 1 ELSE 0 END) AS num_has_family_council
	
FROM providers_extras e;




DROP TABLE IF EXISTS summary.provider_state;

CREATE TABLE summary.provider_state (
	state_id INT
	
	, num INT
	
	, num_beds_avg REAL
	, num_beds_min REAL
	, num_beds_max REAL
	
	, num_residents_avg REAL
	, num_residents_min REAL
	, num_residents_max REAL

	, num_is_medicare INT
	, num_is_medicaid INT
	, num_in_hospital INT
	, num_is_ccrc INT
	, num_is_sff INT
	, num_new_owner INT
	, num_has_resident_council INT
	, num_has_family_council INT
);

INSERT INTO summary.provider_state
SELECT
	state_id
	, COUNT(*) AS num
	
	, CAST(AVG(num_beds) AS REAL) AS num_beds_avg
	, CAST(MIN(num_beds) AS REAL) AS num_beds_min
	, CAST(MAX(num_beds) AS REAL) AS num_beds_max
	
	, CAST(AVG(num_residents) AS REAL) AS num_residents_avg
	, CAST(MIN(num_residents) AS REAL) AS num_residents_min
	, CAST(MAX(num_residents) AS REAL) AS num_residents_max
	
	, SUM(CASE is_medicare WHEN true THEN 1 ELSE 0 END) AS num_is_medicare
	, SUM(CASE is_medicaid WHEN true THEN 1 ELSE 0 END) AS num_is_medicaid
	, SUM(CASE in_hospital WHEN true THEN 1 ELSE 0 END) AS num_in_hospital
	, SUM(CASE is_ccrc WHEN true THEN 1 ELSE 0 END) AS num_is_ccrc
	, SUM(CASE is_sff WHEN true THEN 1 ELSE 0 END) AS num_is_sff
	, SUM(CASE new_owner WHEN true THEN 1 ELSE 0 END) AS num_new_owner
	, SUM(CASE has_resident_council WHEN true THEN 1 ELSE 0 END) AS num_has_resident_council
	, SUM(CASE has_family_council WHEN true THEN 1 ELSE 0 END) AS num_has_family_council
	
FROM providers_extras e
	INNER JOIN providers p ON p.provnum = e.provnum
GROUP BY p.state_id
ORDER BY p.state_id;



CREATE INDEX idx_summary__provider_state__state_id 
ON summary.provider_state (state_id) 
WITH (fillfactor = 100);





DROP TABLE IF EXISTS summary.provider_county;

CREATE TABLE summary.provider_county (
	state_id INT
	, county_id INT
	
	, num INT
	
	, num_beds_avg REAL
	, num_beds_min REAL
	, num_beds_max REAL
	
	, num_residents_avg REAL
	, num_residents_min REAL
	, num_residents_max REAL

	, num_is_medicare INT
	, num_is_medicaid INT
	, num_in_hospital INT
	, num_is_ccrc INT
	, num_is_sff INT
	, num_new_owner INT
	, num_has_resident_council INT
	, num_has_family_council INT
);

INSERT INTO summary.provider_county
SELECT
	state_id
	, county_id
	
	, COUNT(*) AS num
	
	, CAST(AVG(num_beds) AS REAL) AS num_beds_avg
	, CAST(MIN(num_beds) AS REAL) AS num_beds_min
	, CAST(MAX(num_beds) AS REAL) AS num_beds_max
	
	, CAST(AVG(num_residents) AS REAL) AS num_residents_avg
	, CAST(MIN(num_residents) AS REAL) AS num_residents_min
	, CAST(MAX(num_residents) AS REAL) AS num_residents_max
	
	, SUM(CASE is_medicare WHEN true THEN 1 ELSE 0 END) AS num_is_medicare
	, SUM(CASE is_medicaid WHEN true THEN 1 ELSE 0 END) AS num_is_medicaid
	, SUM(CASE in_hospital WHEN true THEN 1 ELSE 0 END) AS num_in_hospital
	, SUM(CASE is_ccrc WHEN true THEN 1 ELSE 0 END) AS num_is_ccrc
	, SUM(CASE is_sff WHEN true THEN 1 ELSE 0 END) AS num_is_sff
	, SUM(CASE new_owner WHEN true THEN 1 ELSE 0 END) AS num_new_owner
	, SUM(CASE has_resident_council WHEN true THEN 1 ELSE 0 END) AS num_has_resident_council
	, SUM(CASE has_family_council WHEN true THEN 1 ELSE 0 END) AS num_has_family_council
	
FROM providers_extras e
	INNER JOIN providers p ON p.provnum = e.provnum
GROUP BY p.state_id, p.county_id
ORDER BY p.state_id, p.county_id;



CREATE INDEX idx_summary__provider_county__state_id_county_id 
ON summary.provider_county (state_id, county_id) 
WITH (fillfactor = 100);




DROP TABLE IF EXISTS summary.provider_city;

CREATE TABLE summary.provider_city (
	state_id INT
	, city_id INT
	
	, num INT
	
	, num_beds_avg REAL
	, num_beds_min REAL
	, num_beds_max REAL
	
	, num_residents_avg REAL
	, num_residents_min REAL
	, num_residents_max REAL

	, num_is_medicare INT
	, num_is_medicaid INT
	, num_in_hospital INT
	, num_is_ccrc INT
	, num_is_sff INT
	, num_new_owner INT
	, num_has_resident_council INT
	, num_has_family_council INT
);

INSERT INTO summary.provider_city
SELECT
	state_id
	, city_id
	
	, COUNT(*) AS num
	
	, CAST(AVG(num_beds) AS REAL) AS num_beds_avg
	, CAST(MIN(num_beds) AS REAL) AS num_beds_min
	, CAST(MAX(num_beds) AS REAL) AS num_beds_max
	
	, CAST(AVG(num_residents) AS REAL) AS num_residents_avg
	, CAST(MIN(num_residents) AS REAL) AS num_residents_min
	, CAST(MAX(num_residents) AS REAL) AS num_residents_max
	
	, SUM(CASE is_medicare WHEN true THEN 1 ELSE 0 END) AS num_is_medicare
	, SUM(CASE is_medicaid WHEN true THEN 1 ELSE 0 END) AS num_is_medicaid
	, SUM(CASE in_hospital WHEN true THEN 1 ELSE 0 END) AS num_in_hospital
	, SUM(CASE is_ccrc WHEN true THEN 1 ELSE 0 END) AS num_is_ccrc
	, SUM(CASE is_sff WHEN true THEN 1 ELSE 0 END) AS num_is_sff
	, SUM(CASE new_owner WHEN true THEN 1 ELSE 0 END) AS num_new_owner
	, SUM(CASE has_resident_council WHEN true THEN 1 ELSE 0 END) AS num_has_resident_council
	, SUM(CASE has_family_council WHEN true THEN 1 ELSE 0 END) AS num_has_family_council
	
FROM providers_extras e
	INNER JOIN providers p ON p.provnum = e.provnum
GROUP BY p.state_id, p.city_id
ORDER BY p.state_id, p.city_id;


CREATE INDEX idx_summary__provider_city__state_id_city_id 
ON summary.provider_city (state_id, city_id) 
WITH (fillfactor = 100);





DROP TABLE IF EXISTS summary.provider_zipcode;

CREATE TABLE summary.provider_zipcode (
	zipcode TEXT
	
	, num INT
	
	, num_beds_avg REAL
	, num_beds_min REAL
	, num_beds_max REAL
	
	, num_residents_avg REAL
	, num_residents_min REAL
	, num_residents_max REAL

	, num_is_medicare INT
	, num_is_medicaid INT
	, num_in_hospital INT
	, num_is_ccrc INT
	, num_is_sff INT
	, num_new_owner INT
	, num_has_resident_council INT
	, num_has_family_council INT
);

INSERT INTO summary.provider_zipcode
SELECT
	zipcode
	
	, COUNT(*) AS num
	
	, CAST(AVG(num_beds) AS REAL) AS num_beds_avg
	, CAST(MIN(num_beds) AS REAL) AS num_beds_min
	, CAST(MAX(num_beds) AS REAL) AS num_beds_max
	
	, CAST(AVG(num_residents) AS REAL) AS num_residents_avg
	, CAST(MIN(num_residents) AS REAL) AS num_residents_min
	, CAST(MAX(num_residents) AS REAL) AS num_residents_max
	
	, SUM(CASE is_medicare WHEN true THEN 1 ELSE 0 END) AS num_is_medicare
	, SUM(CASE is_medicaid WHEN true THEN 1 ELSE 0 END) AS num_is_medicaid
	, SUM(CASE in_hospital WHEN true THEN 1 ELSE 0 END) AS num_in_hospital
	, SUM(CASE is_ccrc WHEN true THEN 1 ELSE 0 END) AS num_is_ccrc
	, SUM(CASE is_sff WHEN true THEN 1 ELSE 0 END) AS num_is_sff
	, SUM(CASE new_owner WHEN true THEN 1 ELSE 0 END) AS num_new_owner
	, SUM(CASE has_resident_council WHEN true THEN 1 ELSE 0 END) AS num_has_resident_council
	, SUM(CASE has_family_council WHEN true THEN 1 ELSE 0 END) AS num_has_family_council
	
FROM providers_extras e
	INNER JOIN providers p ON p.provnum = e.provnum
GROUP BY p.zipcode
ORDER BY p.zipcode;


CREATE INDEX idx_summary__provider_zipcode__zipcode
ON summary.provider_zipcode (zipcode) 
WITH (fillfactor = 100);






--vacuum

/*
select *
from summary.provider_city
limit 10
*/
