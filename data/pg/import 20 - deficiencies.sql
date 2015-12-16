

-- ----------------------------------------
-- 
-- 	POPULATE PROVIDER TABLES
-- 
-- ----------------------------------------


DROP TABLE IF EXISTS public.deficiencies;

CREATE TABLE public.deficiencies (
	provnum TEXT
	, survey_date DATE
	, tag_number TEXT
	, survey_type TEXT
	, scope_severity_code TEXT
	, correction_id INT
	, correction_date DATE
	, inspection_cycle INT
	, standard_deficiency BOOLEAN
	, complaint_deficiency BOOLEAN
	, processing_date DATE
);

INSERT INTO public.deficiencies (
	provnum
	, survey_date
	, tag_number
	, survey_type
	, scope_severity_code
	, correction_id
	, correction_date
	, inspection_cycle
	, standard_deficiency
	, complaint_deficiency
	, processing_date
)
SELECT 
	r.federal_provider_number
	, CAST(r.survey_date AS DATE)
	, r.deficiency_tag_number
	, LEFT(r.survey_type, 1)
	, r.scope_severity_code
	, dc.id
	, CAST(r.correction_date AS DATE)
	, CAST(r.inspection_cycle AS INT)
	, CASE r.standard_deficiency WHEN 'true' THEN true WHEN 'false' THEN false END
	, CASE r.complaint_deficiency WHEN 'true' THEN true WHEN 'false' THEN false END
	, CAST(r.processing_date AS DATE)
FROM import.raw_r5ix_sfxw r
	LEFT JOIN dict.deficiency_corrections dc
		ON r.deficiency_corrected = dc.label;


CREATE INDEX idx_deficiencies__provnum ON public.deficiencies (provnum) WITH (fillfactor = 100);
CREATE INDEX idx_deficiencies__correction_id ON public.deficiencies (correction_id) WITH (fillfactor = 100);



/*

SELECT * 
FROM dict.deficiencies;

SELECT * 
FROM dict.deficiency_corrections;


SELECT distinct deficiency_corrected
FROM import.raw_r5ix_sfxw 
	



SELECT * 
FROM import.raw_r5ix_sfxw r
LIMIT 1000;

SELECT d.*, dc.label
FROM public.deficiencies d
	LEFT JOIN dict.deficiency_corrections dc
		ON d.correction_id = dc.id
WHERE provnum = '14A247'
-- 	AND survey_type = 'F'
-- 	AND complaint_deficiency = true
-- WHERE correction_date IS NULL
ORDER BY survey_type, survey_date DESC, scope_severity_code
LIMIT 1000;



*/