SELECT
	COUNT(*) as num_providers
	, gs.state_id
	, gs.state_name
	, gs.state_slug
	, NULL as city_id
	, NULL as city_name
	, NULL AS city_slug
	, 1 AS sortby
FROM providers p
	INNER JOIN geo.states gs ON gs.state_id = p.state_id
GROUP BY gs.state_id, gs.state_name

UNION ALL

SELECT COUNT(*) as num_providers
	, gs.state_id
	, gs.state_name
	, gs.state_slug
	, gc.city_id
	, gc.city_name
	, gc.city_slug
	, 2 AS sortby
FROM providers p
	INNER JOIN geo.states gs ON gs.state_id = p.state_id
	INNER JOIN geo.cities gc
		ON gc.city_id = p.city_id
		AND gc.state_id = p.state_id
GROUP BY gs.state_id, gs.state_name, gc.city_id, gc.city_name
HAVING COUNT(*) >= 10

ORDER BY state_name, sortby, city_name;