

/*
	npm run remote-get
*/


DROP SCHEMA IF EXISTS import CASCADE;
CREATE SCHEMA import;

DROP SCHEMA IF EXISTS geo CASCADE;
CREATE SCHEMA geo;

DROP SCHEMA IF EXISTS dict CASCADE;
CREATE SCHEMA dict;

DROP SCHEMA IF EXISTS summary CASCADE;
CREATE SCHEMA summary;



CREATE OR REPLACE FUNCTION public.udf_textToSlug(input text) RETURNS text AS $$ 
DECLARE result TEXT;
BEGIN
	result := lower(input);
	result := regexp_replace(result, '[^a-z0-9 ]', ' ', 'gi');
	result := trim(result);
	result := regexp_replace(result, '[ ]{1,}', '-', 'gi');

	RETURN result;
END; 
$$ LANGUAGE PLPGSQL IMMUTABLE LEAKPROOF;


/*
	npm run remote-import
*/