

-- SELECT DISTINCT zc2.*
-- FROM temp_zipcodes zc1
-- 	INNER JOIN temp_zipcodes zc2 ON (
-- 		earth_box(zc1.geo, (1609.34 * 10)) @> zc2.geo
-- 	)
-- WHERE zc1.county_name = 'Uintah'
-- 	AND zc1.city_type = 'D'
-- 	AND zc2.city_type = 'D';

SELECT *
FROM geo.cities c
	inner join geo.states s on s.state_id = c.state_id
WHERE state_slug = 'utah'
	AND city_slug = 'vernal';


SELECT *
FROM geo.zipcodes zc1
	INNER JOIN geo.states st1 ON zc1.state_id = st1.state_id
	INNER JOIN geo.cities ci1 ON (
		st1.state_id = ci1.state_id
		AND zc1.city_id = ci1.city_id
	)
WHERE lower(ci1.city_name) = lower('Vernal')
	AND st1.state_abbr = 'UT'
	AND ci1.city_type = 'D';
	

SELECT 
	ci2.city_name,
	st2.state_name,
	min(earth_distance(zc1.geo, zc2.geo) / (1609.34)) AS distance
FROM geo.zipcodes zc1
	INNER JOIN geo.states st1 ON zc1.state_id = st1.state_id
	INNER JOIN geo.cities ci1 ON (
		st1.state_id = ci1.state_id
		AND zc1.city_id = ci1.city_id
	)
	
	INNER JOIN geo.zipcodes zc2 ON (
		zc1.zipcode <> zc2.zipcode
		AND earth_box(zc1.geo, (1609.34 * 100)) @> zc2.geo
		AND earth_distance(zc1.geo, zc2.geo) < (1609.34 * 100)
	)
	INNER JOIN geo.states st2 ON zc2.state_id = st2.state_id
	INNER JOIN geo.cities ci2 ON (
		st2.state_id = ci2.state_id
		AND zc2.city_id = ci2.city_id
	)
WHERE lower(ci1.city_name) = lower('Vernal')
	AND ci1.city_name <> ci2.city_name
	AND st1.state_abbr = 'UT'
	AND ci1.city_type = 'D'
	AND ci2.city_type = 'D'
GROUP BY 
	ci2.city_name,
	st2.state_name
ORDER BY distance;

	