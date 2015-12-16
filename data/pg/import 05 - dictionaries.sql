

-- ----------------------------------------
-- 
-- 	POPULATE DICTIONARY TABLES
-- 
-- ----------------------------------------





-- dict.ownership_types

DROP TABLE IF EXISTS dict.ownership_types;

CREATE TABLE dict.ownership_types (
	id SERIAL
	, label TEXT
	, base_type TEXT
	, num_providers INT
	, CONSTRAINT pk_dict_ownership_types PRIMARY KEY (id)
);

INSERT INTO dict.ownership_types (	
	label
	, base_type
	, num_providers
)
SELECT
	ownership_type AS label
	, split_part(ownership_type, ' - ', 1) AS base_type
	, COUNT(*) as num_providers
FROM import.raw_4pq5_n9py AS raw
GROUP BY ownership_type
ORDER BY ownership_type;


COPY (
	SELECT array_to_json(array_agg(row_to_json(d)))
	FROM dict.ownership_types d
)
TO 'D:\inet\projects\lnh5\data\static\dict\ownership_types.json';





-- dict.council_types
-- 
-- DROP TABLE IF EXISTS dict.council_types;
-- 
-- CREATE TABLE dict.council_types (
-- 	id SERIAL
-- 	, label TEXT
-- 	, num_providers INT
-- 	, CONSTRAINT pk_dict_councils PRIMARY KEY (id)
-- );
-- 
-- INSERT INTO dict.council_types (	
-- 	label
-- 	, num_providers
-- )
-- SELECT
-- 	with_a_resident_and_family_council AS label
-- 	, COUNT(*) as num_providers
-- FROM import.raw_4pq5_n9py AS raw
-- GROUP BY with_a_resident_and_family_council
-- ORDER BY with_a_resident_and_family_council;





-- dict.sprinkler_status

DROP TABLE IF EXISTS dict.sprinkler_status;

CREATE TABLE dict.sprinkler_status (
	id SERIAL
	, label TEXT
	, num_providers INT
	, CONSTRAINT pk_dict_sprinkler_status PRIMARY KEY (id)
);

INSERT INTO dict.sprinkler_status (	
	label
	, num_providers
)
SELECT
	automatic_sprinkler_systems_in_all_required_areas AS label
	, COUNT(*) as num_providers
FROM import.raw_4pq5_n9py AS raw
GROUP BY automatic_sprinkler_systems_in_all_required_areas
ORDER BY automatic_sprinkler_systems_in_all_required_areas;



COPY (
	SELECT array_to_json(array_agg(row_to_json(d)))
	FROM dict.sprinkler_status d
)
TO 'D:\inet\projects\lnh5\data\static\dict\sprinkler_status.json';






-- dict.deficiencies

DROP TABLE IF EXISTS dict.deficiencies;

CREATE TABLE dict.deficiencies (
	id TEXT
	, survey_type TEXT
	, label TEXT
	, num_providers INT
	, CONSTRAINT pk_dict_deficiencies PRIMARY KEY (id, survey_type)
);

INSERT INTO dict.deficiencies (	
	id
	, survey_type
	, label
	, num_providers
)
SELECT 
	r.Deficiency_Tag_Number AS id
	, LEFT(r.Survey_Type, 1) AS survey_type
	, r.Deficiency_Description AS label
	, COUNT(DISTINCT federal_provider_number) as num_providers
FROM import.raw_r5ix_sfxw r
GROUP BY	
	id
	, survey_type
	, label;


CREATE INDEX idx_dict__deficiencies__number_type 
	ON dict.deficiencies (id, survey_type) 
	WITH (fillfactor = 100);


	
COPY (
	SELECT array_to_json(array_agg(row_to_json(d)))
	FROM (
		SELECT
			id
			, survey_type
			, replace(label, '"', '`') AS label
			, num_providers
		FROM dict.deficiencies
	) d
)
TO 'D:\inet\projects\lnh5\data\static\dict\deficiencies.json';





-- dict.deficiency_corrections

DROP TABLE IF EXISTS dict.deficiency_corrections;

CREATE TABLE dict.deficiency_corrections (
	id SERIAL
	, label TEXT
	, num INT
	, CONSTRAINT pk_dict_deficiency_corrections PRIMARY KEY (id)
);


INSERT INTO dict.deficiency_corrections (label, num)
SELECT deficiency_corrected, COUNT(*)
FROM import.raw_r5ix_sfxw
GROUP BY deficiency_corrected
ORDER BY COUNT(*) DESC;



COPY (
	SELECT array_to_json(array_agg(row_to_json(d)))
	FROM dict.deficiency_corrections d
)
TO 'D:\inet\projects\lnh5\data\static\dict\deficiency_corrections.json';





-- dict.measures

DROP TABLE IF EXISTS dict.measures;

CREATE TABLE dict.measures (
	id TEXT
	, label TEXT
	, resident_type TEXT
	, rated BOOLEAN
	, CONSTRAINT pk_dict_measures PRIMARY KEY (id)
);

INSERT INTO dict.measures (	
	id
	, label
	, resident_type
	, rated
)
SELECT DISTINCT
	r.measure_code AS id
	, r.measure_description AS label
	, LEFT(r.resident_type, 1) AS resident_type
	, CASE r.used_in_quality_measure_five_star_rating WHEN 'true' THEN true WHEN 'false' THEN false END
FROM import.raw_djen_97ju r
ORDER BY id;



COPY (
	SELECT array_to_json(array_agg(row_to_json(d)))
	FROM dict.measures d
)
TO 'D:\inet\projects\lnh5\data\static\dict\measures.json';





-- dict.footnotes

DROP TABLE IF EXISTS dict.footnotes;

CREATE TABLE dict.footnotes (
	id SERIAL
	, label TEXT
	, CONSTRAINT pk_dict_footnotes PRIMARY KEY (id)
);

INSERT INTO dict.footnotes (label)
SELECT DISTINCT label
FROM (
	SELECT DISTINCT footnote_for_q1_measure_score as label
	FROM import.raw_djen_97ju -- measures
	UNION
	SELECT DISTINCT footnote_for_q2_measure_score as label
	FROM import.raw_djen_97ju -- measures
	UNION
	SELECT DISTINCT footnote_for_q3_measure_score as label
	FROM import.raw_djen_97ju -- measures
	UNION
	SELECT DISTINCT footnote_for_three_quarter_average as label
	FROM import.raw_djen_97ju -- measures
	
	UNION
	SELECT DISTINCT Reported_Staffing_Footnote as label
	FROM import.raw_4pq5_n9py -- staffing
	UNION
	SELECT DISTINCT Physical_Therapist_Staffing_Footnote as label
	FROM import.raw_4pq5_n9py -- staffing
	
	UNION
	SELECT DISTINCT overall_rating_footnote as label
	FROM import.raw_4pq5_n9py -- ratings
	UNION
	SELECT DISTINCT health_inspection_rating_footnote as label
	FROM import.raw_4pq5_n9py -- ratings
	UNION
	SELECT DISTINCT qm_rating_footnote as label
	FROM import.raw_4pq5_n9py -- ratings
	UNION
	SELECT DISTINCT staffing_rating_footnote as label
	FROM import.raw_4pq5_n9py -- ratings
	UNION
	SELECT DISTINCT rn_staffing_rating_footnote as label
	FROM import.raw_4pq5_n9py -- ratings
	UNION
	SELECT DISTINCT reported_staffing_footnote as label
	FROM import.raw_4pq5_n9py -- ratings
	UNION
	SELECT DISTINCT physical_therapist_staffing_footnote as label
	FROM import.raw_4pq5_n9py -- ratings
	UNION
	SELECT DISTINCT physical_therapist_staffing_footnote as label
	FROM import.raw_4pq5_n9py -- ratings
) footnotes
WHERE label IS NOT NULL;



COPY (
	SELECT array_to_json(array_agg(row_to_json(d)))
	FROM dict.footnotes d
)
TO 'D:\inet\projects\lnh5\data\static\dict\footnotes.json';





-- dict.owner_roles

DROP TABLE IF EXISTS dict.owner_roles;

CREATE TABLE dict.owner_roles (
	id SERIAL
	, label TEXT
	, num_providers INT
	, CONSTRAINT pk_dict__owner_roles PRIMARY KEY (id)
);

INSERT INTO dict.owner_roles (	
	label
	, num_providers
)
SELECT
	role_played_by_owner_or_manager_in_facility AS label
	, COUNT(*) as num_providers
FROM import.raw_y2hd_n93e AS raw
GROUP BY role_played_by_owner_or_manager_in_facility
ORDER BY role_played_by_owner_or_manager_in_facility;



COPY (
	SELECT array_to_json(array_agg(row_to_json(d)))
	FROM dict.owner_roles d
)
TO 'D:\inet\projects\lnh5\data\static\dict\owner_roles.json';




